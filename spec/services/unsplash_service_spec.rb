require 'rails_helper'

RSpec.describe UnsplashService do
  it 'return the url of an appropriate background image for a location', :vcr do
    location = 'Denver,CO'
    data = UnsplashService.find_background_image(location)

    expect(data[:results].count).to eq(1)

    expect(data).to have_key(:total)
    expect(data).to have_key(:total_pages)
    expect(data).to have_key(:results)
    expect(data[:results].first).to have_key(:urls)
    expect(data[:results].first).to have_key(:user)
    expect(data[:results].first[:urls]).to have_key(:full)
    expect(data[:results].first[:user]).to have_key(:name)

    expect(data).to be_a(Hash)
    expect(data[:results]).to be_an(Array)
    expect(data[:results].first).to be_a(Hash)
    expect(data[:results].first[:urls]).to be_a(Hash)
    expect(data[:results].first[:user]).to be_a(Hash)
    expect(data[:results].first[:urls][:full]).to be_a(String)
    expect(data[:results].first[:user][:name]).to be_a(String)

  end
end
