module Conversions #:nodoc:
  module Ext
    def convert(from, to, options={})
      Unit.new(self, from).to(to, options)
    end
  end
end