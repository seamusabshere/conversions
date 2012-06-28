require 'helper'

describe Conversions do
  describe 'conversions' do
    it 'handles bits and bytes' do
      assert_equal( 65.bit.to_f,  (1.bit + 8.bytes).to_f )
      assert_equal( 0.125.bytes.to_f, 1.bit.to.bytes.to_f )
      assert_in_delta(1.MB.to.kB.to_f, 1024.0, 1e-5)
      assert_in_delta(1.MB.to.b.to_f, 8388608.0, 1e-5)
      assert_in_delta(1.GB.to.B.to_f, 1073741824.0, 1e-5)
      assert_in_delta(1.MiB.to.KiB.to_f, 1024.0, 1e-5)
      assert_in_delta(1.MiB.to.b.to_f, 8388608.0, 1e-5)
      assert_in_delta(1.GiB.to.B.to_f, 1073741824.0, 1e-5)
    end
    it 'uses SI information units if specified' do
      Conversions::use_si = true
      assert_in_delta(1.GB.to.B.to_f, 1000000000.0, 1e-5)
      assert_in_delta(1.MB.to.b.to_f, 8000000.0, 1e-5)
      assert_in_delta(1.MB.to.kB.to_f, 1000.0, 1e-5)
    end
  
    it 'handles distances' do
      assert_equal( 5280.feet,  1.mile.to.feet )
    end
    
    it 'handles areas' do
      assert_in_delta( 4840.square_yards.to_f,  1.acre.to.square_yards.to_f, 1e-5)
    end
    
    it 'handles volumes' do
      assert_in_delta( 3.785411784.L.to_f, 1.gallon.to.L.to_f, 1e-5 )
    end
    
    it 'handles mass' do
      assert_equal( 0.45359237.kg.to_f, 1.lb.to.kg.to_f )
    end
  
    it 'handles temperature' do
      assert_equal(1.fahrenheit, 1.fahrenheit)
    end
  
    it 'handles density' do
      assert_equal(25.brix.to_f, 1.1058.sg.to.brix.truncate(1))
      assert_equal(25.brix, 13.87.baume.truncate(1))    
      assert_equal(25.plato, 25.125.brix)
    end
  end

  describe '.register' do
    it 'registers new units' do
      Conversions.register(:distance, [:beard_second, :beard_seconds], 5.angstroms)
      assert_equal( 1.beard_second, 5.angstroms)    
    end

    it 'registers proc-based unit conversions' do
      Conversions.register(:temperature, :yeti, [Proc.new{|t| t + 1}, Proc.new{|t| t - 1}])
      assert_equal( 0.yeti, 1.kelvin)    
    end

    it 'automatically adds new types' do
      Conversions.register :quux, :qaat, 1.0
      Conversions.register :quux, :quut, 3.0
      assert_equal 1.qaat, 3.quut
    end
  end

  describe '.base' do
    it 'returns a base for a prefixed unit' do
      Conversions.base(:kilogram).should == :gram
    end
    it 'returns a unit that is not prefixed' do
      Conversions.base(:miles).should == :miles
    end
  end

  describe '.type' do
    it 'returns a type for a known unit' do
      assert_equal :mass, Conversions.type(:kilogram)
    end
    it 'returns nil for an unknown unit' do
      assert_nil Conversions.type(:kilogramps)
    end
  end

  describe '.convertable_units' do
    it 'returns a list of units to which one unit can be converted' do
      Conversions.convertable_units(:kilometer).should include(:mile)
    end
    it 'returns nil for an unknown unit' do
      Conversions.convertable_units(:kilogramps).should be_nil
    end
  end

  describe '.convertable?' do
    it 'returns true if two units are convertable' do
      Conversions.convertable?(:miles, :kilometer).should be_true
    end
    it 'returns false if two units are not convertable' do
      Conversions.convertable?(:miles, :pounds).should be_false
    end
    it 'returns true if four units are convertable' do
      Conversions.convertable?(:miles, :kilometer, :fathom, :league).should be_true
    end
    it 'raises ArgumentError if 0 arguments are given' do
      expect { Conversions.convertable? }.to raise_error(ArgumentError)
    end
    it 'raises ArgumentError if 1 argument is given' do
      expect { Conversions.convertable?(:mile) }.to raise_error(ArgumentError)
    end
  end
end
