module Conversions
  class NumericConversion
    include Comparable
    
    def per
      Conversions::CompoundNumericConversion.new(self)
    end
    
    def p
      per
    end
    
    def to(type = nil)
      unless type
        self 
      else
        send(type)
      end
    end
    alias_method :as, :to
    
    def base(unit_type)
      if(Conversions.table[unit_type][@unit_name].is_a?(Array))
        @exponent * Conversions.table[unit_type][@unit_name][0].call(@value)
      else
        @exponent * @value * Conversions.table[unit_type][@unit_name]
      end
    end
    
    def unit_name
      @unit_name
    end
    
    def to_s
      @value.to_s
    end
    
    def value
      @value
    end
    
    def to_f
      @value
    end
    
    def ==(other)
      self <=> other
    end
    
    def <=>(other)
      other.respond_to?(:to) && (self.to_f * @exponent).to_f <=> other.to(@unit_name).to_f
    end
    
    private 
    def initialize value, unit_name, exponent = 1.0
      @value = value.to_f
      @unit_name = unit_name
      @exponent = exponent
    end
    
    def method_missing unit_name, *args, &block
      exponent, unit_name = Conversions.parse_prefix(unit_name)
      if Registry[ unit_name ]  
        types = Registry[ @unit_name] & Registry[ unit_name]
        if types[0] # assume first type
          if(Conversions.table[types[0]][unit_name].is_a?(Array))
            Conversions.table[types[0]][unit_name][1].call(base(types[0]))
          else
            NumericConversion.new(base(types[0]) / (exponent * Conversions.table[types[0]][unit_name]), unit_name)
          end
        else
          raise Exception, "Incompatible Types"
        end
      else
        if args[0] && args[0].is_a?(NumericConversion) && Conversions.operator_actions[unit_name]
          t1 = Registry[ @unit_name ][0]
          t2 = Registry[ args[0].unit_name ][0]
          Conversions.operator_actions[unit_name].each do |s1, s2, new_type|
            if t1 == s1 && t2 == s2
              return (@value * args[0].to_f).send(new_type)
            end
          end
        end
        if unit_name == :*
          if args[0].is_a?(Numeric)
            @value *= args[0]
            return self
          else
            raise Exception, "Incompatible Types"
          end
        end
        if unit_name == :/ && args[0].is_a?(NumericConversion)
          raise Exception, "Incompatible Types" unless (Registry[@unit_name] & Registry[args[0].unit_name]).length > 0  
        end
        args.map!{|a| a.is_a?(NumericConversion) ? a.send(@unit_name).to_f / @exponent : a }
        @value = @value.send( unit_name, *args, &block )
        
        
        unit_name == :/ ? @value : self
      end
    end
  end
end 
