class ForecastFacade
  class << self
    def weather_search(city_state)
      attributes = MapQuestService.find_location(city_state)
      location = Coordinates.new(attributes)
      weather = WeatherService.retrieve_forecast_data(location.latitude, location.longitude)

      Forecast.new(weather)
    end
  end
end
