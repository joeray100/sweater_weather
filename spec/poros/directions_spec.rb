# require 'rails_helper'
#
# RSpec.describe Directions do
#   it 'it should build a Directions PORO' do
#
#     poro = Directions.new(info)
#
#     expect(poro).to be_an_instance_of(Directions)
#     expect(poro.id).to eq(278)
#     expect(poro.title).to eq("The Shawshank Redemption")
#     expect(poro.vote_average).to eq(8.7)
#     expect(poro.runtime).to eq(142)
#     expect(poro.format_genres).to eq("Drama, Crime")
#   end
# end

# {
#   data: {
#     id: null,
#     type: 'roadtrip',
#
#     attributes: {
#       start_city: 'Denver, CO',
#       end_city: 'Estes Park, CO',
#       travel_time: '2 hours, 13 minutes',
#
#       weather_at_eta: {
#         temperature: 59.4,
#         conditions: "partly cloudy with a chance of meatballs"
#       }
#     }
#   }
# }


# [ attributes, an object containing road trip information
# start_city, string, such as “Denver, CO”
# end_city, string, such as “Estes Park, CO”
# travel_time, string, something user-friendly like “2 hours, 13 minutes” or “2h13m” or “02:13:00” or something of that nature (you don’t have to include seconds); set this string to “impossible route” if there is no route between your cities
# weather_at_eta, conditions at end_city when you arrive (not CURRENT weather), object containing:
# temperature, numeric value in Fahrenheit
# conditions, string, as given by OpenWeather
# note: this object will be blank if the travel time is impossible ]
