require 'rails_helper'

RSpec.describe 'Breweries API' do
  describe 'happy path' do
    it 'should return the correct json object with correct attributes', :vcr do
      location = 'denver,co'
      quantity = 5
      get api_v1_breweries_path, params: { location: location, quantity: quantity}

      expect(response).to be_successful

      breweries = JSON.parse(response.body, symbolize_names: true)

      expect(breweries[:data][:id]).to eq(nil)
      expect(breweries[:data][:type]).to eq("breweries")

      expect(breweries).to have_key(:data)
      expect(breweries[:data]).to have_key(:id)
      expect(breweries[:data]).to have_key(:type)
      expect(breweries[:data]).to have_key(:attributes)
      expect(breweries[:data][:attributes]).to have_key(:destination)
      expect(breweries[:data][:attributes]).to have_key(:forecast)
      expect(breweries[:data][:attributes]).to have_key(:breweries)
      expect(breweries[:data][:attributes][:forecast]).to have_key(:summary)
      expect(breweries[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(breweries[:data][:attributes][:breweries][0]).to have_key(:id)
      expect(breweries[:data][:attributes][:breweries][0]).to have_key(:name)
      expect(breweries[:data][:attributes][:breweries][0]).to have_key(:brewery_type)


      expect(breweries).to be_an(Hash)
      expect(breweries[:data]).to be_an(Hash)
      expect(breweries[:data][:attributes]).to be_an(Hash)
      expect(breweries[:data][:attributes][:forecast]).to be_an(Hash)
      expect(breweries[:data][:attributes][:breweries]).to be_an(Array)
      expect(breweries[:data][:attributes][:forecast][:summary]).to be_an(String)
      expect(breweries[:data][:attributes][:forecast][:temperature]).to be_an(String)
      expect(breweries[:data][:attributes][:breweries][0][:id]).to be_an(Integer)
      expect(breweries[:data][:attributes][:breweries][0][:name]).to be_an(String)
      expect(breweries[:data][:attributes][:breweries][0][:brewery_type]).to be_an(String)
    end
  end

  describe 'sad path' do
    it 'should return error if quantity is less than or equal to 0' do
      location = 'denver,co'
      quantity = 0
      get api_v1_breweries_path, params: { location: location, quantity: quantity}

      error_response = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      expect(error_response).to eq('Quantity must be higher than 0')
    end

    it 'returns error if location is empty' do
      location = ''
      quantity = 5
      get api_v1_breweries_path, params: { location: location, quantity: quantity}

      error_response = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)
      expect(error_response).to eq('Please give a location to be searched')
    end
  end
end
