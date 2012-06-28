module Conversions
  module NumericExt
    def from(unit_name)
      send(unit_name)
    end
  
    def method_missing unit_name, *args, &block
      exponent, unit_name = Conversions.parse_prefix(unit_name)
      Registry[ unit_name ] || super( unit_name, *args, &block )
      NumericConversion.new self, unit_name, exponent
    end
  end
end
