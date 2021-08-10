class UnsplashService < BaseService
  class << self
    def find_background_image(location)
      response = conn('https://api.unsplash.com').get('/search/photos',
        query: location,
        per_page: 1,
        client_id: ENV['UNSPLASH_API']
      )
      parse_json(response)
    end
  end
end
