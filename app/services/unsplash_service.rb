class UnsplashService
  class << self
    def find_background_image(location)
      response = conn.get('/search/photos',
        query: location,
        per_page: 1,
        client_id: ENV['UNSPLASH_API']
      )
      parse_json(response)
    end

    private

    def conn
      Faraday.new(url: 'https://api.unsplash.com')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
