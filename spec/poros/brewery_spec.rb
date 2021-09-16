require 'rails_helper'

RSpec.describe Brewery do
  it 'it should build a Brewery PORO', :vcr do
    location = 'denver,co'
    quantity = 5
    attributes = MapQuestService.find_location(location)
    coordinate = Coordinates.new(attributes)
    weather = WeatherService.retrieve_forecast_data(coordinate.latitude, coordinate.longitude)
    lat_lon = "#{coordinate.latitude}" + ',' + "#{coordinate.longitude}"
    breweries = OpenBreweryService.find_breweries_list(lat_lon, quantity)
    poro = Brewery.new(location, weather, breweries)

    expect(poro).to be_an_instance_of(Brewery)
    expect(poro.id).to eq(nil)
    expect(poro.destination).to eq('denver,co')
    expect(poro.forecast).to eq({:summary=>"clear sky", :temperature=>"75 F"})
    expect(poro.breweries).to eq([{:id=>8962, :name=>"Black Beak Brewing", :brewery_type=>"planning"},
     {:id=>8245, :name=>"Aero Craft Brewing", :brewery_type=>"planning"},
     {:id=>13467, :name=>"Pints Pub Brewery and Freehouse", :brewery_type=>"brewpub"},
     {:id=>11093, :name=>"Grandma's House", :brewery_type=>"micro"},
     {:id=>8598, :name=>"Banded Oak Brewing Company", :brewery_type=>"brewpub"}])

    expect(poro.breweries.count).to eq(5)

    expect(poro.id).to be_a(NilClass)
    expect(poro.destination).to be_a(String)
    expect(poro.forecast).to be_a(Hash)
    expect(poro.breweries).to be_a(Array)
    expect(poro.forecast[:summary]).to be_a(String)
    expect(poro.forecast[:temperature]).to be_a(String)
    expect(poro.breweries[0]).to be_a(Hash)
    expect(poro.breweries[0][:id]).to be_a(Integer)
    expect(poro.breweries[0][:name]).to be_a(String)
    expect(poro.breweries[0][:brewery_type]).to be_a(String)

    expect(poro.forecast).to have_key(:summary)
    expect(poro.forecast).to have_key(:temperature)
    expect(poro.breweries[0]).to have_key(:id)
    expect(poro.breweries[0]).to have_key(:name)
    expect(poro.breweries[0]).to have_key(:brewery_type)

    # Tests for what it should NOT have
    expect(poro.breweries[0]).to_not have_key(:street)
    expect(poro.breweries[0]).to_not have_key(:city)
    expect(poro.breweries[0]).to_not have_key(:phone)
    expect(poro.breweries[0]).to_not have_key(:website_url)
  end
end
