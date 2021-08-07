require 'rails_helper'

RSpec.describe 'ForecastFacade' do
  it 'returns the forecasted weather for specified location', :vcr do
    forecast = ForecastFacade.weather_search('Denver,CO')
    
    expect(forecast).to be_a(Forecast)
    expect(forecast.id).to eq(nil)
    expect(forecast.current_weather).to be_a(Hash)
    expect(forecast.daily_weather).to be_an(Array)
    expect(forecast.hourly_weather).to be_an(Array)
  end
end
