require 'rails_helper'

RSpec.describe Coordinates do
  it 'it should build a Coordinates PORO correctly' do
    info =
    {:info=>{:statuscode=>0, :copyright=>{:text=>"© 2021 MapQuest, Inc.", :imageUrl=>"http://api.mqcdn.com/res/mqlogo.gif", :imageAltText=>"© 2021 MapQuest, Inc."}, :messages=>[]},
     :options=>{:maxResults=>1, :thumbMaps=>true, :ignoreLatLngInput=>false},
     :results=>
      [{:providedLocation=>{:location=>"Denver,CO"},
        :locations=>
         [{:street=>"",
           :adminArea6=>"",
           :adminArea6Type=>"Neighborhood",
           :adminArea5=>"Denver",
           :adminArea5Type=>"City",
           :adminArea4=>"Denver County",
           :adminArea4Type=>"County",
           :adminArea3=>"CO",
           :adminArea3Type=>"State",
           :adminArea1=>"US",
           :adminArea1Type=>"Country",
           :postalCode=>"",
           :geocodeQualityCode=>"A5XAX",
           :geocodeQuality=>"CITY",
           :dragPoint=>false,
           :sideOfStreet=>"N",
           :linkId=>"282041090",
           :unknownInput=>"",
           :type=>"s",
           :latLng=>{:lat=>39.738453, :lng=>-104.984853},
           :displayLatLng=>{:lat=>39.738453, :lng=>-104.984853},
           :mapUrl=>
            "http://www.mapquestapi.com/staticmap/v5/map?key=AWXwRoeAZcBI9dAKwH758um0hnVlQBsH&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-1&scalebar=true&zoom=12&rand=459389728"}]}]}

    coordinates = Coordinates.new(info)

    expect(coordinates).to be_an_instance_of(Coordinates)

    expect(coordinates.latitude).to be_a(Float)
    expect(coordinates.longitude).to be_a(Float)

    expect(coordinates.latitude).to eq(39.738453)
    expect(coordinates.longitude).to eq(-104.984853)
  end
end
