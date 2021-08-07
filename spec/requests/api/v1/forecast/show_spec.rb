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
  end

  # describe 'sad path' do
  #   it 'bad location id returns 404' do
  #     get "/api/v1/forecast?location=324"
  #
  #     require 'pry'; binding.pry
  #     expect(response).to_not be_successful
  #     expect(response).to have_http_status(404)
  #     error = JSON.parse(response.body, symbolize_names: true)[:error]
  #     expect(error).to eq("Couldn't find Merchant with 'id'=324")
  #   end
  # end
end
