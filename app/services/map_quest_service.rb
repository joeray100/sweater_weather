class MapQuestService
  class << self
    def find_location(location)
      response = conn.get('/geocoding/v1/address',
        location: location,
        maxResults: 1
      )
      parse_json(response)
    end

    def create_route(origin, destination)
      response = conn.get('/directions/v2/route',
        from: origin,
        to: destination
      )
      parse_json(response)
    end

    private

    def conn
      Faraday.new(url: 'http://www.mapquestapi.com',
        params: { key: ENV['MAP_Q_API'] }
      )
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
