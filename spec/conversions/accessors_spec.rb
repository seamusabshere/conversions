require 'helper'

class Trip
  extend Conversions::Accessors

  attr_accessor :distance
  conversion_accessor :distance, :internal => :kilometers, :external => :miles
end

class Fall < ActiveRecord::Base
  attr_accessor :distance
  conversion_accessor :distance, :internal => :kilometers, :external => :miles
end

describe Conversions::Accessors do
  shared_examples_for 'an object with convertible accessors' do
    it 'provides <attr>_in_<units>' do
      instance = klass.new
      instance.distance = 5
      instance.distance_in_miles.to_f.should be_within(0.01).of(3.10)
      instance.distance.to_f.should == 5
    end
    it 'provides <attr>_in_<units>=' do
      instance = klass.new
      instance.distance_in_miles = 5
      instance.distance.to_f.should be_within(0.000001).of(8.04672)
    end
  end

  context 'on POROs' do
    let(:klass) { Trip }
    it_behaves_like 'an object with convertible accessors'
  end
  
  context 'on ActiveRecord::Base models' do
    let(:klass) { Fall }
    it_behaves_like 'an object with convertible accessors'
  end
end

