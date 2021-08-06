require 'rails_helper'

RSpec.describe 'ForecastFacade' do
  it 'returns the lat and long from searching a city, state' do
    VCR.use_cassette('returns lat and lon when given a city') do
      coordinates_object = ForecastFacade.city_coordinates_search('Denver,CO')

      expect(coordinates_object).to be_a(Coordinates)
      expect(coordinates_object.latitude).to be_a(Float)
      expect(coordinates_object.longitude).to be_a(Float)
    end
  end
end
