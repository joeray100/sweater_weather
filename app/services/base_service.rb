class BaseService
  class << self
    def conn(url)
      Faraday.new(url: url)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
