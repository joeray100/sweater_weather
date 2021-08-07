class Forecast
  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(poro_info)
    @id = nil
    @current_weather = make_current_weather(poro_info[:current])
    @daily_weather = make_daily_weather(poro_info[:daily][0..4])
    @hourly_weather = make_hourly_weather(poro_info[:hourly][0..7])
  end

  def make_current_weather(info)
    {
      datetime: Time.at(info[:dt]).to_s,
      sunrise: Time.at(info[:sunrise]).to_s,
      sunset: Time.at(info[:sunset]).to_s,
      temperature: info[:temp],
      feels_like: info[:feels_like],
      humidity: info[:humidity],
      uvi: info[:uvi],
      visibility: info[:visibility],
      conditions: info[:weather][0][:description],
      icon: info[:weather][0][:icon]
    }
  end

  def make_daily_weather(info)
    info.map do |hash|
      {
        date: Time.at(hash[:dt]).strftime('%F'),
        sunrise: Time.at(hash[:sunrise]).to_s,
        sunset: Time.at(hash[:sunset]).to_s,
        max_temp: hash[:temp][:max],
        min_temp: hash[:temp][:min],
        conditions: hash[:weather][0][:description],
        icon: hash[:weather][0][:icon]
      }
    end
  end

  def make_hourly_weather(info)
    info.map do |hash|
      {
        time: Time.at(hash[:dt]).strftime('%T'),
        temperature: hash[:temp],
        conditions: hash[:weather][0][:description],
        icon: hash[:weather][0][:icon]
      }
    end
  end
end
