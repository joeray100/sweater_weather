require 'rails_helper'

RSpec.describe Brewery do
  it 'it should build a Brewery PORO' do
    location = '39.742043,-104.991531'
    per_page = 5
    breweries_list = OpenBreweryService.find_breweries_list(location, per_page)

    poro = Brewery.new(breweries_list)

    expect(poro).to be_an_instance_of(Brewery)
    expect(poro.id).to eq(nil)
    expect(poro.breweries.count).to eq(5)

    expect(poro.breweries).to be_a(Array)
    expect(poro.breweries[0]).to be_a(Hash)

    expect(poro.breweries[0][:id]).to be_a(Integer)
    expect(poro.breweries[0][:name]).to be_a(String)
    expect(poro.breweries[0][:brewery_type]).to be_a(String)


    expect(poro.breweries[0]).to have_key(:id)
    expect(poro.breweries[0]).to have_key(:name)
    expect(poro.breweries[0]).to have_key(:brewery_type)

    expect(poro.breweries[0]).to_not have_key(:street)
    expect(poro.breweries[0]).to_not have_key(:city)
    expect(poro.breweries[0]).to_not have_key(:phone)
    expect(poro.breweries[0]).to_not have_key(:website_url)
  end
end
