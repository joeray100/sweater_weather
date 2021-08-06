class WeatherService
  class << self
    def retrieve_forecast_data(lat, lon)
      response = conn.get('/data/2.5/onecall?',
        lat: lat,
        lon: lon,
        exclude: 'minutely,alerts',
        units: 'imperial',
        appid: ENV['WEATHER_API']
      )
      parse_json(response)
    end

    private

    def conn
      Faraday.new(url: 'https://api.openweathermap.org')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
