require 'conversions/compound_numeric_conversion'
require 'conversions/default_table'
require 'conversions/numeric_conversion'
require 'conversions/numeric_ext'
require 'conversions/unit_prefixes'

module Conversions
  Registry = {}

  @use_si = false
  class << self
    attr_accessor :use_si
  end
  
  @@si_units = %w[m meter metre meters metres liter litre litres liters l L farad farads F coulombs C gray grays Gy siemen siemens S mhos mho ohm ohms volt volts V ]
  @@si_units += %w[joule joules J newton newtons N lux lx henry henrys H b B bits bytes bit byte lumen lumens lm candela candelas cd]
  @@si_units += %w[tesla teslas T gauss Gs G gram gramme grams grammes g watt watts W pascal pascals Pa]
  @@si_units += %w[becquerel becquerels Bq curie curies Ci]
  
  def self.unit_prefixes
    @@unit_prefixes ||= UnitPrefixes
  end
  
  def self.table
    @@table ||= DefaultTable
  end
  
  def self.operator_actions
    @@operator_actions ||= {}
  end

  def self.type(measurement)
    convos = Registry[base(measurement)]
    convos ? convos.first : nil
  end

  def self.convertable_units(unit)
    list = table[type(unit)]
    list ? list.keys - [unit] : nil
  end

  def self.convertable?(*units)
    raise ArgumentError.new('You need specify at least two units') if units.length < 2

    units.each do |unit_a|
      type_a = type(unit_a)
      units.each do |unit_b|
        return false if type_a != type(unit_b)
      end
    end

    true
  end
  
  table.each do |type, conversions|
    conversions.each do |name, value|
      Registry[name] ||= []
      Registry[name] << type
    end
  end
  
  def self.register(type, names, value)
    names = [names] unless names.is_a?(Array)
    value = value.is_a?(NumericConversion) ? value.base(type) : value
    Conversions.table[type] ||= {}
    names.each do |name|
      Registry[name] ||= []
      Registry[name] << type
      Conversions.table[type][name] = value
    end
  end

	def self.register_operation type, other_type, operation, converted_type
	  operator_actions[operation] ||= []
    operator_actions[operation] << [type, other_type, converted_type]
	end
  
  def self.parse_prefix(unit)
    unit_prefixes.each do |prefix, value|
      if unit.to_s =~ /^#{prefix}.+/ && @@si_units.include?(unit.to_s.gsub(/^#{prefix}/,''))        
        if !(Registry[ unit.to_s.gsub(/^#{prefix}/,'').to_sym ] & [ :information_storage ]).empty? && !@use_si && value >= 1000.0 && value.to_i & -value.to_i != value
          value = 2 ** (10 * (Math.log(value) / Math.log(10)) / 3)
        end
        return [value, unit.to_s.gsub(/^#{prefix}/,'').to_sym]
      end
    end
    [1.0, unit]
  end

  def self.base(unit)
    parse_prefix(unit).last
  end
end

class Numeric
  include Conversions::NumericExt
end

require 'conversions/compound'
