class RoadTripFacade < BaseFacade
  class << self
    def road_trip_search(origin, destination)
      travel_time = MapQuestService.create_route(origin, destination)
      weather = BaseFacade.find_weather_for_destination(destination)
      Directions.new(origin, destination, travel_time, weather)
    end
  end
end
