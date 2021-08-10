require 'rails_helper'

RSpec.describe Directions do
  it 'it should build a Directions PORO', :vcr do
    origin = 'Denver,CO'
    destination = 'Pueblo,CO'
    travel_time = MapQuestService.create_route(origin, destination)
    coordinates = MapQuestService.find_location(destination)[:results][0][:locations][0][:latLng]
    weather = WeatherService.retrieve_forecast_data(coordinates[:lat], coordinates[:lng])

    poro = Directions.new(origin, destination, travel_time, weather)

    expect(poro).to be_an_instance_of(Directions)
    expect(poro.id).to eq(nil)
    expect(poro.start_city).to eq('Denver,CO')
    expect(poro.end_city).to eq('Pueblo,CO')
    expect(poro.travel_time).to eq("01:44:22")
    expect(poro.weather_at_eta).to eq({:conditions=>"overcast clouds", :temperature=>95.76})

    expect(poro.id).to be_a(NilClass)
    expect(poro.start_city).to be_a(String)
    expect(poro.end_city).to be_a(String)
    expect(poro.travel_time).to be_a(String)
    expect(poro.weather_at_eta).to be_a(Hash)
  end
end
