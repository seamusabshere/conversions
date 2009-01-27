module Conversions #:nodoc
  # Proxy class to contain the unit as well as reference the base value
  class Unit
    # Create a new Unit instance.
    #
    # * _value_: The value to convert from (ie. 4.92)
    # * _from_: The unit to convert from (ie. :miles)
    def initialize(value, from)
      @value = value
      @from = from
    end

    # Convert to a certain other unit.
    #
    # * _to_: The unit to convert to (ie. :kilometers)
    # * _scale_: The number of digits behind the decimal point to you want to keep (Optional)
    def to(to, options = {})
      scale = options.delete(:scale)
      value = @value * self.class.exchange_rate(@from, to)
      scale.nil? ? value : (value * (10 ** scale)).round / (10 ** scale).to_f
    end

    def self.exchange_rate(from_unit, to_unit) #:nodoc:
      return 1 if from_unit == to_unit
      from = Conversions.conversions[from_unit]
      raise ArgumentError, "Can't convert from `#{from}', unknown unit" if from.nil?
      to = from[to_unit]
      raise ArgumentError, "Can't convert from `#{from_unit}' to `#{to_unit}', unknown unit" if to.nil?
      to
    end
  end
end
