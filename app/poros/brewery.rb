class Brewery
  attr_reader :id,
              :destination,
              :forecast,
              :breweries

  def initialize(location, weather, poro_info)
    @id = nil
    @destination = location
    @forecast = create_forecast(weather[:current])
    @breweries = create_brewery_list(poro_info)
  end

  def create_forecast(data)
    {
      summary: data[:weather][0][:description],
      temperature: "#{data[:temp].round} F"
    }
  end

  def create_brewery_list(data)
    data.map do |brewery|
      {
        id: brewery[:id],
        name: brewery[:name],
        brewery_type: brewery[:brewery_type],
      }
    end
  end
end
