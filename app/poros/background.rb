class Background
  attr_reader :id,
              :image,
              :location

  def initialize(location, poro_info)
    @id = nil
    @location = location
    @image = create_image(poro_info[:results][0])
  end

  def create_image(data)
    {
      location: @location,
      image_url: data[:urls][:full],
      credit: create_credit(data[:user])
    }
  end

  def create_credit(data)
    {
      source: 'https://unsplash.com',
      author: data[:name],
      logo: 'https://unsplash.com/photos/QdqK4doOzcQ'
    }
  end
end
