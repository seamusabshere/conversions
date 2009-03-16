require File.dirname(__FILE__) + '/test_helper'

class UnitTest < Test::Unit::TestCase
  def setup
    reset_defaults
  end
  
  def test_exchange_rate
    assert_in_delta 1.609344, Conversions::Unit.exchange_rate(:miles, :kilometres), DELTA
    assert_in_delta 0.621371192237334, Conversions::Unit.exchange_rate(:kilometres, :miles), DELTA
    assert_raises(ArgumentError) { Conversions::Unit.exchange_rate(:unknown, :miles) }
    assert_raises(ArgumentError) { Conversions::Unit.exchange_rate(:miles, :unknown) }
    assert_raises(ArgumentError) { Conversions::Unit.exchange_rate(nil, :miles) }
    assert_raises(ArgumentError) { Conversions::Unit.exchange_rate(:miles, nil) }
  end
  
  def test_exchange_rate_for_identity_transform
    Conversions.conversions.keys.each do |unit|
      assert_equal 1, Conversions::Unit.exchange_rate(unit, unit)
    end
  end
  
  def test_to
    amount = Conversions::Unit.new(10.0, :miles)
    assert_in_delta 16.09344, amount.to(:kilometres), DELTA
    
    amount = Conversions::Unit.new(10.0, :kilograms)
    assert_in_delta 22.0462262184878, amount.to(:pounds), DELTA
  end
  
  def test_to_with_scale
    amount = Conversions::Unit.new(10.0, :miles)
    assert_equal 16.1, amount.to(:kilometres, :scale => 1)
    assert_equal 16.09, amount.to(:kilometres, :scale => 2)
    assert_equal 16.093, amount.to(:kilometres, :scale => 3)
  end
  
  def test_identity_transforms
    Conversions.conversions.keys.each do |unit|
      assert_equal 1.0, Conversions::Unit.new(1.0, unit).to(unit, :scale => 2)
    end
  end
  
  def test_register
    Conversions.register(:dollars, :cents, 100.0)
    assert_in_delta 0.01, Conversions::Unit.exchange_rate(:cents, :dollars), DELTA
    amount = Conversions::Unit.new(10.0, :dollars)
    assert_equal 1000.0, amount.to(:cents, :scale => 2), DELTA
  end
end