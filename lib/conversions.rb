module Conversions
  CONVERSION = {
    :miles => {
      :kilometres => 1.609344
    },
    :kilograms => {
      :grams => 1000.0,
      :pounds => 2.20462262,
      :short_tons => 0.00110231131,
      :tons => 0.00110231131
    },
    :tons => {
      :pounds => 2000.0
    },
    :gallons => {
      :litres => 3.7854118
    },
    :cubic_feet => {
      :cubic_meters => 0.0283168466
    },
    :miles_per_gallon => {
      :kilometres_per_litre => 0.425143707
    }
  }
end

require 'conversions/unit'
require 'conversions/ext'
require 'conversions/active_record_accessors'

Numeric.send :include, Conversions::Ext
if defined?(ActiveRecord)
  ActiveRecord::Base.send :extend, Conversions::ActiveRecordAccessors
end
