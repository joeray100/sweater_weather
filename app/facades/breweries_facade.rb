class BreweriesFacade
  class << self
    def breweries_search(location, quantity)
      attributes = MapQuestService.find_location(location)
      coordinate = Coordinates.new(attributes)
      weather = WeatherService.retrieve_forecast_data(coordinate.latitude, coordinate.longitude)
      lat_lon = "#{coordinate.latitude}" + ',' + "#{coordinate.longitude}"
      breweries = OpenBreweryService.find_breweries_list(lat_lon, quantity)
      Brewery.new(location, weather, breweries)
    end
  end
end
