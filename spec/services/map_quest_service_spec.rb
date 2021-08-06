require 'rails_helper'

RSpec.describe MapQuestService do
  it 'returns lat and lon when given a city', :vcr do
    location = 'Denver,CO'
    data = MapQuestService.find_location(location)
    
    expect(data).to be_a(Hash)
    expect(data[:results]).to be_a(Array)
    expect(data[:results][0][:locations]).to be_a(Array)
    expect(data[:results][0][:locations][0][:latLng]).to be_a(Hash)
    expect(data[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
    expect(data[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)

    expect(data).to have_key(:results)
    expect(data[:results][0]).to have_key(:locations)
    expect(data[:results][0][:locations][0]).to have_key(:latLng)
    expect(data[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(data[:results][0][:locations][0][:latLng]).to have_key(:lng)
  end
end
