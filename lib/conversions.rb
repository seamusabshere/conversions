require 'active_support'
require 'active_support/version'
%w{
  active_support/core_ext/module/attribute_accessors
}.each do |active_support_3_requirement|
  require active_support_3_requirement
end if ActiveSupport::VERSION::MAJOR == 3

# Conversions makes it easy to convert between units.
module Conversions
  mattr_accessor :conversions

  # Clear all previously registered conversions
  def self.clear
    self.conversions = {}
  end
  clear
  
  # Load all the default conversions shipped with the code
  def self.load_defaults
    load File.expand_path('../conversions/defaults.rb', __FILE__)
  end

  # Register a new conversion. This automatically also registers the inverse conversion.
  #
  # * _from_: The unit to convert from (ie. :miles, :stones, or :pints)
  # * _to_: The unit to convert to
  # * _rate_: The conversion rate from _from_ to _to_. (_from_ * _rate_ = _to_)
  def self.register(from, to, rate)
    conversions[from] ||= {}
    conversions[from][to] = rate
    conversions[to] ||= {}
    conversions[to][from] = 1.0 / rate
    define_shortcut(from)
    define_shortcut(to)
  end

  def self.define_shortcut(unit)
    Numeric.class_eval do
      define_method unit do
        Conversions::Unit.new(self, unit)
      end unless respond_to? unit
    end
  end

  module Ext
    # Convert from one unit to another.
    #
    # * _from_: The unit to convert from (ie. :miles, :stones, or :pints)
    # * _to_: The unit to convert to
    # * _options_:
    #   * :scale: The number of digits you want after the dot.
    def convert(from, to, options={})
      Conversions::Unit.new(self, from).to(to, options)
    end
  end
end

require 'conversions/unit'

Conversions.load_defaults
Numeric.send(:include, Conversions::Ext)

if defined?(ActiveRecord)
  require 'conversions/active_record_accessors'
  ActiveRecord::Base.send(:extend, Conversions::ActiveRecordAccessors)
end