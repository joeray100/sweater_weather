require 'rails_helper'

RSpec.describe 'RoatTrip API' do
  describe 'happy path' do
    it 'should successfully return road trip json object', :vcr do
      params = {
        origin: 'Denver,CO',
        destination: 'Pueblo,CO',
        api_key: "6Rc89gwyIQDS0gNa43t1iuyLSvodkito"
      }

      post api_v1_road_trip_index_path, params: params

      trip = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(trip).to have_key(:data)
      expect(trip[:data]).to have_key(:id)
      expect(trip[:data]).to have_key(:type)
      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to have_key(:start_city)
      expect(trip[:data][:attributes]).to have_key(:end_city)
      expect(trip[:data][:attributes]).to have_key(:travel_time)
      expect(trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)


      expect(trip).to be_a(Hash)
      expect(trip[:data]).to be_a(Hash)
      expect(trip[:data][:id]).to be_a(NilClass)
      expect(trip[:data][:type]).to be_a(String)
      expect(trip[:data][:attributes]).to be_a(Hash)
      expect(trip[:data][:attributes][:start_city]).to be_a(String)
      expect(trip[:data][:attributes][:end_city]).to be_a(String)
      expect(trip[:data][:attributes][:travel_time]).to be_a(String)
      expect(trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(trip[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end

    it 'returns correct info for long road trip' do
      params = {
        origin: 'New York, NY',
        destination: 'Los Angeles, CA',
        api_key: "6Rc89gwyIQDS0gNa43t1iuyLSvodkito"
      }

      post api_v1_road_trip_index_path, params: params

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(error[:data][:attributes][:start_city]).to eq('New York, NY')
      expect(error[:data][:attributes][:end_city]).to eq('Los Angeles, CA')
      expect(error[:data][:attributes][:travel_time]).to eq('40:34:31')
      expect(error[:data][:attributes][:weather_at_eta][:temperature]).to eq(74.14)
      expect(error[:data][:attributes][:weather_at_eta][:conditions]).to eq('clear sky')
    end
  end

  describe 'sad path' do
    it 'returns error for impossible route', :vcr do
      params = {
        origin: 'New York, NY',
        destination: 'London, UK',
        api_key: "6Rc89gwyIQDS0gNa43t1iuyLSvodkito"
      }

      post api_v1_road_trip_index_path, params: params

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(error[:data][:attributes][:start_city]).to eq('New York, NY')
      expect(error[:data][:attributes][:end_city]).to eq('London, UK')
      expect(error[:data][:attributes][:travel_time]).to eq("impossible route")
      expect(error[:data][:attributes][:weather_at_eta]).to eq({})
    end
  end
end
