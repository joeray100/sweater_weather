class OpenBreweryService
  class << self
    def find_breweries_list(location, per_page)
      response = conn.get('/breweries',
        by_dist: location,
        per_page: per_page
      )
      parse_json(response)
    end

    private

    def conn
      Faraday.new(url: 'https://api.openbrewerydb.org')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
