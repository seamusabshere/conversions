require File.dirname(__FILE__) + '/test_helper'

class ExtTest < Test::Unit::TestCase
  def setup
    reset_defaults
  end
  
  def test_conversions
    assert_in_delta 1.609344, 1.convert(:miles, :kilometres), DELTA
    assert_in_delta 1.609344, 1.0.convert(:miles, :kilometres), DELTA
    assert_in_delta 0.45359237, 1.convert(:pounds, :kilograms), DELTA
    assert_in_delta 0.00110231131092439, 1.convert(:kilograms, :tons), DELTA
    assert_in_delta 2.20462262184878, 1.convert(:kilograms, :pounds), DELTA
    assert_in_delta 1, ( 1.convert(:kilograms, :pounds) * 1.convert(:pounds, :kilograms) ), DELTA
  end
  
  def test_register
    Conversions.register(:dollars, :cents, 100.0)
    assert_in_delta 1000.0, 10.convert(:dollars, :cents), DELTA
  end
end