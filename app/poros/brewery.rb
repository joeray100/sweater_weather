class Brewery
  attr_reader :id,
              :breweries

  def initialize(poro_info)
    @id = nil
    @breweries = create_brewery_list(poro_info)
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
