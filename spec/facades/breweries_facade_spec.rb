require 'rails_helper'

RSpec.describe 'BreweriesFacade' do
  it 'returns brewery object with all of the necessary attributes' do
    location = 'denver,co'
    quantity = 5
    facade = BreweriesFacade.breweries_search(location, quantity)

    expect(facade).to be_a(Brewery)
    expect(facade.id).to eq(nil)
    expect(facade.destination).to be_a(String)
    expect(facade.forecast).to be_a(Hash)
    expect(facade.forecast.count).to eq(2)
    expect(facade.breweries.count).to eq(5)
    expect(facade.breweries).to be_a(Array)
    expect(facade.forecast[:summary]).to be_a(String)
    expect(facade.forecast[:temperature]).to be_a(String)
    expect(facade.breweries[0][:id]).to be_a(Integer)
    expect(facade.breweries[0][:name]).to be_a(String)
    expect(facade.breweries[0][:brewery_type]).to be_a(String)

    expect(facade.forecast).to have_key(:summary)
    expect(facade.forecast).to have_key(:temperature)
    expect(facade.breweries[0]).to have_key(:id)
    expect(facade.breweries[0]).to have_key(:name)
    expect(facade.breweries[0]).to have_key(:brewery_type)
  end
end
