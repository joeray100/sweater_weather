class BaseFacade
  class << self
    def find_weather_for_specified_location(location)
      lat_lon = MapQuestService.find_location(location)
      coordinates = Coordinates.new(lat_lon)
      WeatherService.retrieve_forecast_data(coordinates.latitude, coordinates.longitude)
    end
    def coordinates_for_brewery(location)
      lat_lon = MapQuestService.find_location(location)
      coordinate = Coordinates.new(lat_lon)
      "#{coordinate.latitude}" + ',' + "#{coordinate.longitude}"
    end
    def find_weather_for_destination(destination)
      lat_lon = MapQuestService.find_location(destination)
      coordinates = Coordinates.new(lat_lon)
      WeatherService.retrieve_forecast_data(coordinates.latitude, coordinates.longitude)
    end
  end
end
