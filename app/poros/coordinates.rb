class Coordinates
  attr_reader :latitude,
              :longitude

  def initialize(service_data)
    @latitude = service_data[:results][0][:locations][0][:latLng][:lat]
    @longitude = service_data[:results][0][:locations][0][:latLng][:lng]
  end
end
