require 'test/unit'

if not defined?(ActiveRecord)
  require 'rubygems'
  require 'active_record'
end

$:.unshift File.dirname(__FILE__) + '/../lib'
require 'conversions'

def reset_defaults
  Conversions.clear
  Conversions.load_defaults
end

DELTA = 0.0000001
