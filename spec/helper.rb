$:.unshift(File.dirname(__FILE__) + '../lib')
require 'alchemist'

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

