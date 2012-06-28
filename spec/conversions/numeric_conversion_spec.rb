require 'helper'

describe Conversions::NumericConversion do
  describe '#==' do
    it 'returns true for equivalent units' do
      assert_equal(1.m, 1.meter)
    end
    it 'returns true for differing units' do
      assert_equal( 5.grams, 0.005.kilograms )
    end
    it 'is not equivalent to non-numerics' do
      assert_not_equal 1.meter, false
    end
  end
  
  describe '#*' do
    it 'converts scalars into square units' do
      assert_equal(1.meter * 1.meter, 1.square_meter)
    end
    it 'converts scalars into cubic units' do
      assert_equal(1.meter * 2.meter * 3.meter, 6.cubic_meters)
    end
    it 'converts scalars and square units into cubic units' do
      assert_equal(2.square_meters * 3.meters, 6.cubic_meters)
    end
  end

  describe '#/' do
    it 'divides scalars' do
      assert_equal(2.meters / 1.meters, 2.0)
    end
  end
end
