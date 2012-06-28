require 'bundler/setup'

class ActiveRecord
  class Base
  end
end

require 'conversions'

require 'test/unit/assertions'
RSpec.configure do |c|
  c.include Test::Unit::Assertions
end

class Float
  # truncates float to specified decimal places
  def truncate(dec = 0)
    return to_i if dec == 0
    sprintf("%.#{dec}f", self).to_f
  end
end

