require 'helper'

describe Alchemist::CompoundNumericConversion do
  describe '#*' do
    it 'multiplies rates times measurements' do
      assert_equal 30.miles, (10.miles.per.second * 3.seconds)
      assert_equal 30.km, (10.km.p.h * 3.hours)
    end
  end
  describe '#==' do
    it 'compares to other numerics' do
      assert_equal 4, 4.m.per.m
    end
  end
end
