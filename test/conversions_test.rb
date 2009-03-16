require File.dirname(__FILE__) + '/test_helper'

class ConversionsTest < Test::Unit::TestCase
  def setup
    Conversions.clear
  end
  
  def test_register
    Conversions.register(:records, :cds, 0.47)
    assert 2, Conversions.conversions.length
    
    assert_nothing_raised do
      1.convert(:records, :cds)
      1.convert(:cds, :records)
    end
  end
  
  def test_clear
    Conversions.register(:records, :cds, 0.47)
    assert 2, Conversions.conversions.length
    Conversions.clear
    assert 0, Conversions.conversions.length
  end
end