class WeatherService < BaseService
  class << self
    def retrieve_forecast_data(lat, lon)
      response = conn('https://api.openweathermap.org').get('/data/2.5/onecall?',
        lat: lat,
        lon: lon,
        exclude: 'minutely,alerts',
        units: 'imperial', # For temperature in Fahrenheit and wind speed in miles/hour, use units=imperial
        appid: ENV['WEATHER_API']
      )
      parse_json(response)
    end
  end
end
