class Directions
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(start_city, end_city, travel_time, weather)
    @id = nil
    @start_city = start_city
    @end_city = end_city
    @travel_time = create_travel_time(travel_time)
    @weather_at_eta = create_weather_at_eta(weather, travel_time, end_city)
  end

  def create_travel_time(travel)
    code = travel[:info][:statuscode]
    if code != 0
      'impossible route'
    else
      travel[:route][:formattedTime]
    end
  end

  def create_weather_at_eta(weather, travel, end_city)
    if @travel_time == 'impossible route'
      {}
    elsif @travel_time.to_i < 48
      {
        temperature: weather[:hourly][@travel_time.to_i][:temp],
        conditions: weather[:hourly][@travel_time.to_i][:weather][0][:description]
      }
    elsif @travel_time.to_i > 48 && @travel_time.to_i < 192 # more than 2 less than 8 days
      {
        temperature: weather[:daily][@travel_time.to_i/24 - 1][:temp][:day],
        conditions: weather[:daily][@travel_time.to_i/24 - 1][:weather][0][:description]
      }
    end
  end
end
