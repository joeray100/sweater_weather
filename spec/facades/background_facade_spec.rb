require 'rails_helper'

RSpec.describe 'BackgroundFacade' do
  it 'returns the background image for city searched', :vcr do
    facade = BackgroundFacade.background_image('Denver,CO')

    expect(facade).to be_a(Background)
    expect(facade.id).to eq(nil)
    expect(facade.image).to be_a(Hash)
    expect(facade.image[:credit]).to be_a(Hash)
    expect(facade.location).to be_a(String)
  end
end
