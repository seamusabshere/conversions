# Conversions

Converting units LIKE A BOSS (now based on the alchemist gem)

## What?

Having unit conversion code that looks like this is meaningless

    miles = 8 * 1609.344

You could add comments

    miles = 8 * 1609.344 # converting meters to miles

But why not have this?

    8.meters.to.miles

You can even perform mathematic operations

    10.kilometers + 1.mile # 11.609344 kilometers

You may also register your own units

    Conversions.register(:distance, [:beard_second, :beard_seconds], 5.angstroms)

You can even compare different units

    5.grams == 0.005.kilograms


## Installation

    gem install conversions

## Usage

    require 'conversions'	
    
    puts 5.miles.to.kilometers

If you're using rails, add to your Gemfile:

    gem 'conversions'

## Conversions has conversions for:

### Distance

* metres or meters
* fermis
* microns
* chains
* inches
* microinches
* mils
* rods
* leagues
* feet
* yards
* miles
* astronomical_units
* light_years
* parsecs
* nautical_miles
* admirality_miles
* fathoms
* cable_lengths
* angstroms
* picas
* printer_picas
* points
* printer_points

### Mass

* grams or grammes
* carats
* ounces
* pennyweights
* pounds
* troy_pounds or apothecary_pounds
* slugs
* assay_tons
* metric_tons
* tons or short_tons

### Volume

* litres or liters
* barrels
* bushels
* cubic_meters
* cups
* imperial_fluid_ounces
* fluid_ounces
* imperial_gallons
* gallons
* imperial_gills
* gills
* pints
* liquid_pints
* quarts
* liquid_quarts
* tablespoons
* teaspoons

### And many more!

Check out *lib/conversions/default_table.rb* for the rest

## Collaboration cycle 

Please contribute patches!

### You
1.  Fork the emitter repository on GitHub.
1.  Write a test proving the existing implementation's inadequacy. Ensure that the test fails.
1.  Improve the code until your new test passes and commit your changes.
1.  Push your changes to your GitHub fork.
1.  Submit a pull request to us.

### We
1.  Receive a pull request.
1.  Pull changes from forked repository.
1.  Ensure tests pass.
1.  Review changes
1.  Merge changes to master repository and publish.
