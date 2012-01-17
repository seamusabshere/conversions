module Conversions
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
    
    def to_i
      @value.to_i
    end
    
    def to_f
      @value.to_f
    end

    # Convert to a certain other unit.
    #
    # * _to_: The unit to convert to (ie. :kilometers)
    # * _options_:
    #   * :scale: The number of digits behind the decimal point to you want to keep
    def to(to, options={})
      case options
      when Integer
        scale = options
      when Hash
        scale = options[:scale]
      end
      
      value = @value * self.class.exchange_rate(@from, to)
      scale.nil? ? value : (value * (10 ** scale)).round / (10 ** scale).to_f
    end

    def self.exchange_rate(from_unit_name, to_unit_name) #:nodoc:
      return 1 if from_unit_name == to_unit_name
      from = Conversions.conversions[from_unit_name]
      raise ArgumentError, "[conversions] No unit named `#{from_unit_name}'" if from.blank?
      to = from[to_unit_name]
      raise ArgumentError, "[conversions] No exchange rate defined from `#{from_unit_name}' to `#{to_unit_name}'" if to.blank?
      to
    end
  end
end
