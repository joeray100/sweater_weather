class Directions
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres

  def initialize(start_city, end_city, travel_time, weather)
    @id = nil
    @start_city = poro_info[:start_city]
    @end_city = poro_info[:end_city]
    @travel_time = poro_info[:travel_time]
    @weather_at_eta = poro_info[:weather_at_eta]
  end
end
