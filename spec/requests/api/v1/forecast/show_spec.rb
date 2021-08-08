require 'rails_helper'

RSpec.describe "Forecast API", type: :request do
  describe 'happy path' do
    it 'shows weather forecast for given location', :vcr do
      location = 'denver,co'
      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful
      weather = JSON.parse(response.body, symbolize_names: true)

      expect(weather).to have_key(:data)
      expect(weather[:data]).to have_key(:id)
      expect(weather[:data]).to have_key(:type)
      expect(weather[:data]).to have_key(:attributes)
      expect(weather[:data][:attributes]).to have_key(:current_weather)
      expect(weather[:data][:attributes]).to have_key(:daily_weather)
      expect(weather[:data][:attributes]).to have_key(:hourly_weather)

      expect(weather).to be_a(Hash)
      expect(weather[:data][:id]).to eq(nil)
      expect(weather[:data][:type]).to be_a(String)
      expect(weather[:data][:attributes]).to be_a(Hash)
      expect(weather[:data][:attributes][:current_weather]).to be_a(Hash)
      expect(weather[:data][:attributes][:daily_weather]).to be_an(Array)
      expect(weather[:data][:attributes][:hourly_weather]).to be_an(Array)

      expect(weather[:data][:attributes][:current_weather].count).to eq(10)
      expect(weather[:data][:attributes][:daily_weather].count).to eq(5)
      expect(weather[:data][:attributes][:hourly_weather].count).to eq(8)
    end

    it 'Testing should look for more than just the presence of attribute fields in the response. Testing should also determine which fields should NOT be present. (don’t send unnecessary data)', :vcr do
      location = 'denver,co'
      get "/api/v1/forecast?location=#{location}"

      expect(response).to be_successful
      weather = JSON.parse(response.body, symbolize_names: true)

      # keys current weather should NOT have
      expect(weather[:data][:attributes][:current_weather]).to_not have_key(:pressure)
      expect(weather[:data][:attributes][:current_weather]).to_not have_key(:dew_point)
      expect(weather[:data][:attributes][:current_weather]).to_not have_key(:clouds)
      expect(weather[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
      expect(weather[:data][:attributes][:current_weather]).to_not have_key(:wind_deg)
      expect(weather[:data][:attributes][:current_weather]).to_not have_key(:wind_gust)

      # keys daily weather should NOT have
      expect(weather[:data][:attributes][:daily_weather][0]).to_not have_key(:moonrise)
      expect(weather[:data][:attributes][:daily_weather][0]).to_not have_key(:moonset)
      expect(weather[:data][:attributes][:daily_weather][0]).to_not have_key(:moon_phase)
      expect(weather[:data][:attributes][:daily_weather][0]).to_not have_key(:feels_like)
      expect(weather[:data][:attributes][:daily_weather][0]).to_not have_key(:pressure)
      expect(weather[:data][:attributes][:daily_weather][0]).to_not have_key(:humidity)
      expect(weather[:data][:attributes][:daily_weather][0]).to_not have_key(:dew_point)
      expect(weather[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_speed)
      expect(weather[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_deg)
      expect(weather[:data][:attributes][:daily_weather][0]).to_not have_key(:wind_gust)

      # keys hourly weather should NOT have
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:feels_like)
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:pressure)
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:humidity)
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:dew_point)
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:uvi)
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:clouds)
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:visibility)
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_speed)
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_deg)
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:wind_gust)
      expect(weather[:data][:attributes][:hourly_weather][0]).to_not have_key(:pop)
    end
  end

  describe 'sad path' do
    it 'return error if no location given', :vcr do
      get "/api/v1/forecast?location="

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)
      error = JSON.parse(response.body, symbolize_names: true)[:error]
      expect(error).to eq('No location given')
    end
  end
end
