class OpenBreweryService < BaseService
  class << self
    def find_breweries_list(location, per_page)
      response = conn('https://api.openbrewerydb.org').get('/breweries',
        by_dist: location,
        per_page: per_page
      )
      parse_json(response)
    end
  end
end
