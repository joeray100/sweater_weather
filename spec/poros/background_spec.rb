require 'rails_helper'

RSpec.describe Background do
  it 'it should build a Background PORO' do
    city = 'Denver,CO'
    poro = Background.new(city, image_info)

    expect(poro).to be_an_instance_of(Background)
    expect(poro.id).to eq(nil)
    expect(poro.image).to be_a(Hash)
    expect(poro.location).to be_a(String)
    expect(poro.image[:credit]).to be_a(Hash)
    expect(poro.image[:credit][:source]).to be_a(String)
    expect(poro.image[:credit][:author]).to be_a(String)
    expect(poro.image[:credit][:logo]).to be_a(String)

    expect(poro.image).to eq({:location=>"Denver,CO",
     :image_url=>
      "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTIxNjV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2MjgzODIyMDg&ixlib=rb-1.2.1&q=85",
      :credit=>{:source=>"https://unsplash.com", :author=>"Ryan De Hamer", :logo=>"https://unsplash.com/photos/QdqK4doOzcQ"}})
    expect(poro.location).to eq('Denver,CO')
    expect(poro.image[:image_url]).to eq("https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTIxNjV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2MjgzODIyMDg&ixlib=rb-1.2.1&q=85")
    expect(poro.image[:credit]).to eq({:source=>"https://unsplash.com", :author=>"Ryan De Hamer", :logo=>"https://unsplash.com/photos/QdqK4doOzcQ"})
    expect(poro.image[:credit][:source]).to eq("https://unsplash.com")
    expect(poro.image[:credit][:author]).to eq("Ryan De Hamer")
    expect(poro.image[:credit][:logo]).to eq("https://unsplash.com/photos/QdqK4doOzcQ")
  end
end
