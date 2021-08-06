require 'rails_helper'

RSpec.describe WeatherService do
  it 'returns the current, daily, and hourly weather for a given location', :vcr do
    lat = 39.742043
    lon = -104.991531
    data = WeatherService.retrieve_forecast_data(lat, lon)

    expect(data).to be_a(Hash)
    expect(data[:current]).to be_a(Hash)
    expect(data[:daily]).to be_a(Array)
    expect(data[:hourly]).to be_a(Array)

    expect(data).to have_key(:current)
    expect(data).to have_key(:daily)
    expect(data).to have_key(:hourly)

    expect(data).to_not have_key(:minutely)
    expect(data).to_not have_key(:alerts)

    expect(data[:minutely]).to be_a(NilClass)
    expect(data[:alerts]).to be_a(NilClass)
  end
end
