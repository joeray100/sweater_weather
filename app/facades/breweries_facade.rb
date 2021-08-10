class BreweriesFacade < BaseFacade
  class << self
    def breweries_search(location, quantity)
      weather = BaseFacade.find_weather_for_specified_location(location)
      lat_lon = BaseFacade.coordinates_for_brewery(location)
      breweries = OpenBreweryService.find_breweries_list(lat_lon, quantity)
      Brewery.new(location, weather, breweries)
    end
  end
end
