Conversions.register_operation(:distance, :distance, :*, :square_meters)
Conversions.register_operation(:area, :distance, :*, :cubic_meters)
Conversions.register_operation(:distance, :area, :*, :cubic_meters)
Conversions.register_operation(:area, :distance, :/, :meters)
Conversions.register_operation(:volume, :distance, :/, :square_meters)
Conversions.register_operation(:volume, :area, :/, :meters)
