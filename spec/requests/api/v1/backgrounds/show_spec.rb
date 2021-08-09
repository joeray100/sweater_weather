require 'rails_helper'

RSpec.describe 'Backgrounds API' do
  describe 'happy path' do
    it 'will return the background image json object', :vcr do
      location = 'denver,co'
      get "/api/v1/backgrounds?location=#{location}"

      expect(response).to be_successful
      image = JSON.parse(response.body, symbolize_names: true)

      expect(image.count).to eq(1)
      expect(image).to have_key(:data)
      expect(image[:data]).to have_key(:id)
      expect(image[:data]).to have_key(:type)
      expect(image[:data]).to have_key(:attributes)
      expect(image[:data][:attributes]).to have_key(:image)
      expect(image[:data][:attributes][:image]).to have_key(:location)
      expect(image[:data][:attributes][:image]).to have_key(:image_url)
      expect(image[:data][:attributes][:image]).to have_key(:credit)
      expect(image[:data][:attributes][:image][:credit]).to have_key(:source)
      expect(image[:data][:attributes][:image][:credit]).to have_key(:author)
      expect(image[:data][:attributes][:image][:credit]).to have_key(:logo)

      expect(image).to be_a(Hash)
      expect(image[:data]).to be_a(Hash)
      expect(image[:data]).to be_a(Hash)
      expect(image[:data][:attributes]).to be_a(Hash)
      expect(image[:data][:attributes][:image]).to be_a(Hash)
      expect(image[:data][:attributes][:image][:credit]).to be_a(Hash)
      expect(image[:data][:attributes][:image][:location]).to be_a(String)
      expect(image[:data][:attributes][:image][:image_url]).to be_a(String)
      expect(image[:data][:attributes][:image][:credit][:source]).to be_a(String)
      expect(image[:data][:attributes][:image][:credit][:author]).to be_a(String)
      expect(image[:data][:attributes][:image][:credit][:logo]).to be_a(String)
    end
  end
end
