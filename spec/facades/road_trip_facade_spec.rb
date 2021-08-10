require 'rails_helper'

RSpec.describe 'RoadTripFacade' do
  it 'returns object with road trip information', :vcr do
    origin = 'Denver,CO'
    destination = 'Pueblo,CO'
    facade = RoadTripFacade.road_trip_search(origin, destination)

    expect(facade).to be_a(Directions)

    expect(facade.id).to be_a(NilClass)
    expect(facade.start_city).to be_a(String)
    expect(facade.end_city).to be_a(String)
    expect(facade.travel_time).to be_a(String)
    expect(facade.weather_at_eta).to be_a(Hash)
  end
end
