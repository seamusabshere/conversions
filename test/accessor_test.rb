require File.dirname(__FILE__) + '/test_helper'

class Flight
  extend Conversions::ActiveRecordAccessors
  attr_accessor :distance, :fuel_consumption
  conversion_accessor :distance, :internal => :kilometres, :external => :miles
  conversion_accessor :fuel_consumption, :internal => :litres, :external => :gallons, :scale => 2
  
  Conversions.register(:kilometres, :leagues, 0.179985601)
  conversion_accessor :distance, :internal => :kilometres, :external => :leagues, :scale => 2
end

class AccessorTest < Test::Unit::TestCase

  def setup
    @flight = Flight.new
  end

  def test_include
    assert @flight.respond_to?(:distance)
    assert @flight.respond_to?(:distance_in_miles)
  end

  def test_conversion
    @flight.distance = 1200
    assert_in_delta 745.645430684801, @flight.distance_in_miles, DELTA
  end

  def test_conversion_with_scale
    @flight.fuel_consumption = 3400
    assert_equal 898.18, @flight.fuel_consumption_in_gallons, DELTA
  end
  
  def test_register
    @flight.distance = 1200
    assert_in_delta 215.98, @flight.distance_in_leagues, DELTA
  end
end