describe Alchemist do
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
      Alchemist::use_si = true
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
      Alchemist.register(:distance, [:beard_second, :beard_seconds], 5.angstroms)
      assert_equal( 1.beard_second, 5.angstroms)    
    end

    it 'registers proc-based unit conversions' do
      Alchemist.register(:temperature, :yeti, [Proc.new{|t| t + 1}, Proc.new{|t| t - 1}])
      assert_equal( 0.yeti, 1.kelvin)    
    end

    it 'automatically adds new types' do
      Alchemist.register :quux, :qaat, 1.0
      Alchemist.register :quux, :quut, 3.0
      assert_equal 1.qaat, 3.quut
    end
  end

  describe '.base' do
    it 'returns a base for a prefixed unit' do
      Alchemist.base(:kilogram).should == :gram
    end
    it 'returns a unit that is not prefixed' do
      Alchemist.base(:miles).should == :miles
    end
  end
end
