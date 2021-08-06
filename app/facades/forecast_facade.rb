class ForecastFacade
  class << self
    def city_coordinates_search(city_state)
      attributes = MapQuestService.find_location(city_state)
      Coordinates.new(attributes)
    end
  end
end
