class ForecastFacade < BaseFacade
  class << self
    def weather_search(city_state)
      weather = BaseFacade.find_weather_for_specified_location(city_state)
      Forecast.new(weather)
    end
  end
end
