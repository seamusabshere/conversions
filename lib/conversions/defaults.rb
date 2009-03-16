{
  :miles => {
    :kilometres => 1.609344
  },
  :kilograms => {
    :grams => 1000.0,
    :pounds => 2.20462262,
    :short_tons => 0.00110231131,
    :tons => 0.00110231131
  },
  :tons => {
    :pounds => 2000.0
  },
  :gallons => {
    :litres => 3.7854118
  },
  :cubic_feet => {
    :cubic_meters => 0.0283168466
  },
  :miles_per_gallon => {
    :kilometres_per_litre => 0.425143707
  }
}.each do |from_unit, to_units|
  to_units.each do |to_unit, rate|
    Conversions.register(from_unit, to_unit, rate)
  end
end