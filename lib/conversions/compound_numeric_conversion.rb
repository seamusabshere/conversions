module Conversions
  class CompoundNumericConversion
    attr_accessor :numerators, :denominators
    def initialize(numerator)
      @coefficient = 1 #* numerator.to_f
      @numerators = [numerator]
      @denominators = []
    end
    def *(value)
      case value
      when Numeric 
         @coefficient *= value
         self
      when NumericConversion
        @numerators << value
        return consolidate
      end
    end
    
    def consolidate
      @numerators.each_with_index do |numerator, n|
        @denominators.each_with_index do |denominator, d|
          next if numerator.is_a?(Numeric)
          next if denominator.is_a?(Numeric)
          if (Registry[numerator.unit_name] & Registry[denominator.unit_name]).length > 0
            value = numerator / denominator
            @numerators.delete_at(n)
            @denominators.delete_at(d)
            @coefficient *= value
          end
        end
      end
      if @denominators.length == 0 && @numerators.length == 1
        @numerators[0] * @coefficient
      elsif @denominators.length == 0 && @numerators.length == 0
        @coefficient
      else
        self
      end
    end
    
    def to_s
      
    end
    
    def method_missing(method, *attrs, &block)
      if Registry[method]
        @denominators << 1.send(method)
        consolidate
      end
    end
  end
end
