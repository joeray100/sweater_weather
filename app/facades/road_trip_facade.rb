class RoadTripFacade
  class << self
    def road_trip_search(origin, destination)
      travel_time = MapQuestService.create_route(origin, destination)
      coordinates = MapQuestService.find_location(destination)[:results][0][:locations][0][:latLng]
      weather = WeatherService.retrieve_forecast_data(coordinates[:lat], coordinates[:lng])
      Directions.new(origin, destination, travel_time, weather)
    end
  end
end
