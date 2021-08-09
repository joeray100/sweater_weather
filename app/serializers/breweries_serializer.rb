class BreweriesSerializer
  include JSONAPI::Serializer
  attributes :destination, :forecast, :breweries
end
