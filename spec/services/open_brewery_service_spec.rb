require 'rails_helper'

RSpec.describe OpenBreweryService do
  it 'return a list of breweries by lat and lon', :vcr do
    location = '39.742043,-104.991531'
    quantity = 5

    breweries = OpenBreweryService.find_breweries_list(location, quantity)

    expect(breweries).to be_an(Array)
    expect(breweries[0][:id]).to be_an(Integer)
    expect(breweries[0][:name]).to be_a(String)
    expect(breweries[0][:brewery_type]).to be_a(String)
    expect(breweries[0][:street]).to be_a(String)
    expect(breweries[0][:address_2]).to be_a(NilClass)
    expect(breweries[0][:address_3]).to be_a(NilClass)
    expect(breweries[0][:city]).to be_a(String)
    expect(breweries[0][:state]).to be_a(String)
    expect(breweries[0][:county_province]).to be_a(NilClass)
    expect(breweries[0][:postal_code]).to be_a(String)
    expect(breweries[0][:country]).to be_a(String)
    expect(breweries[0][:longitude]).to be_a(String)
    expect(breweries[0][:latitude]).to be_a(String)
    expect(breweries[0][:phone]).to be_a(String)
    expect(breweries[0][:website_url]).to be_a(String)
    expect(breweries[0][:updated_at]).to be_a(String)
    expect(breweries[0][:created_at]).to be_a(String)

    expect(breweries[0]).to have_key(:id)
    expect(breweries[0]).to have_key(:name)
    expect(breweries[0]).to have_key(:brewery_type)
    expect(breweries[0]).to have_key(:street)
    expect(breweries[0]).to have_key(:address_2)
    expect(breweries[0]).to have_key(:address_3)
    expect(breweries[0]).to have_key(:city)
    expect(breweries[0]).to have_key(:state)
    expect(breweries[0]).to have_key(:county_province)
    expect(breweries[0]).to have_key(:postal_code)
    expect(breweries[0]).to have_key(:country)
    expect(breweries[0]).to have_key(:longitude)
    expect(breweries[0]).to have_key(:latitude)
    expect(breweries[0]).to have_key(:phone)
    expect(breweries[0]).to have_key(:website_url)
    expect(breweries[0]).to have_key(:updated_at)
    expect(breweries[0]).to have_key(:created_at)
  end
end
