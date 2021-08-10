class MapQuestService < BaseService
  class << self
    def find_location(location)
      response = conn('http://www.mapquestapi.com').get('/geocoding/v1/address',
        key: ENV['MAP_Q_API'],
        location: location,
        maxResults: 1
      )
      parse_json(response)
    end

    def create_route(origin, destination)
      response = conn('http://www.mapquestapi.com').get('/directions/v2/route',
        key: ENV['MAP_Q_API'],
        from: origin,
        to: destination
      )
      parse_json(response)
    end
  end
end
