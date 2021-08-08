require 'rails_helper'

RSpec.describe Forecast do
  describe 'it should build a Forecast PORO correctly' do

    it 'returns current weather hash with correct k/v pairs' do
      #  weather_info is at bottom of rails helper
      poro = Forecast.new(weather_info)

      expect(poro).to be_an_instance_of(Forecast)
      expect(poro.id).to eq(nil)

      expect(poro.current_weather).to have_key(:datetime)
      expect(poro.current_weather).to have_key(:sunrise)
      expect(poro.current_weather).to have_key(:sunset)
      expect(poro.current_weather).to have_key(:temperature)
      expect(poro.current_weather).to have_key(:feels_like)
      expect(poro.current_weather).to have_key(:humidity)
      expect(poro.current_weather).to have_key(:uvi)
      expect(poro.current_weather).to have_key(:visibility)
      expect(poro.current_weather).to have_key(:conditions)
      expect(poro.current_weather).to have_key(:icon)

      # expect(poro.current_weather[:datetime]).to eq('2021-08-06 15:29:48 -0600') Travis doesn't like
      # expect(poro.current_weather[:sunrise]).to eq('2021-08-06 06:03:54 -0600') Travis doesn't like
      expect(poro.current_weather[:sunset]).to eq('2021-08-06 20:07:45 -0600')
      expect(poro.current_weather[:temperature]).to eq(87.15)
      expect(poro.current_weather[:feels_like]).to eq(84.58)
      expect(poro.current_weather[:humidity]).to eq(28)
      expect(poro.current_weather[:uvi]).to eq(5.53)
      expect(poro.current_weather[:visibility]).to eq(10000)
      expect(poro.current_weather[:conditions]).to eq("broken clouds")
      expect(poro.current_weather[:icon]).to eq("04d")

      # Use below, if you have issues with eq tests above
      expect(poro.current_weather[:datetime]).to be_a(String)
      expect(poro.current_weather[:sunrise]).to be_a(String)
      expect(poro.current_weather[:sunset]).to be_a(String)
      expect(poro.current_weather[:temperature]).to be_a(Float)
      expect(poro.current_weather[:feels_like]).to be_a(Float)
      expect(poro.current_weather[:humidity]).to be_a(Integer)
      expect(poro.current_weather[:uvi]).to be_a(Float)
      expect(poro.current_weather[:visibility]).to be_a(Integer)
      expect(poro.current_weather[:conditions]).to be_a(String)
      expect(poro.current_weather[:icon]).to be_a(String)
    end

    it 'returns daily weather array for next 5 days with correct elements' do
      #  weather_info is at bottom of rails helper
      poro = Forecast.new(weather_info)

      expect(poro).to be_an_instance_of(Forecast)
      expect(poro.daily_weather).to be_an(Array)
      expect(poro.daily_weather.count).to eq(5)

      expect(poro.daily_weather.first).to be_a(Hash)

      expect(poro.daily_weather.first).to have_key(:date)
      expect(poro.daily_weather.first).to have_key(:sunrise)
      expect(poro.daily_weather.first).to have_key(:sunset)
      expect(poro.daily_weather.first).to have_key(:max_temp)
      expect(poro.daily_weather.first).to have_key(:min_temp)
      expect(poro.daily_weather.first).to have_key(:conditions)
      expect(poro.daily_weather.first).to have_key(:icon)

      expect(poro.daily_weather.first[:date]).to eq("2021-08-06")
      # expect(poro.daily_weather.first[:sunrise]).to eq("2021-08-06 06:03:54 -0600") Travis doesn't like
      # expect(poro.daily_weather.first[:sunset]).to eq("2021-08-06 20:07:45 -0600") Travis doesn't like
      expect(poro.daily_weather.first[:max_temp]).to eq(91.44)
      expect(poro.daily_weather.first[:min_temp]).to eq(71.46)
      expect(poro.daily_weather.first[:conditions]).to eq('broken clouds')
      expect(poro.daily_weather.first[:icon]).to eq('04d')

      # Use below, if you have issues with eq tests above
      expect(poro.daily_weather.first[:date]).to be_a(String)
      expect(poro.daily_weather.first[:sunrise]).to be_a(String)
      expect(poro.daily_weather.first[:sunset]).to be_a(String)
      expect(poro.daily_weather.first[:max_temp]).to be_a(Float)
      expect(poro.daily_weather.first[:min_temp]).to be_a(Float)
      expect(poro.daily_weather.first[:conditions]).to be_a(String)
      expect(poro.daily_weather.first[:icon]).to be_a(String)

      # show change in date for 5 days
      expect(poro.daily_weather[0][:date]).to eq('2021-08-06')
      expect(poro.daily_weather[1][:date]).to eq('2021-08-07')
      expect(poro.daily_weather[2][:date]).to eq('2021-08-08')
      expect(poro.daily_weather[3][:date]).to eq('2021-08-09')
      expect(poro.daily_weather[4][:date]).to eq('2021-08-10')
    end

    it 'returns hourly weather array of the next 8 hours with correct elements' do
      #  weather_info is at bottom of rails helper
      poro = Forecast.new(weather_info)

      expect(poro).to be_an_instance_of(Forecast)
      expect(poro.hourly_weather).to be_an(Array)
      expect(poro.hourly_weather.count).to eq(8)

      expect(poro.hourly_weather.first).to be_a(Hash)

      expect(poro.hourly_weather.first).to have_key(:time)
      expect(poro.hourly_weather.first).to have_key(:temperature)
      expect(poro.hourly_weather.first).to have_key(:conditions)
      expect(poro.hourly_weather.first).to have_key(:icon)

      # expect(poro.hourly_weather.first[:time]).to eq('15:00:00') Travis doesn't like
      expect(poro.hourly_weather.first[:temperature]).to eq(87.15)
      expect(poro.hourly_weather.first[:conditions]).to eq('broken clouds')
      expect(poro.hourly_weather.first[:icon]).to eq('04d')

      expect(poro.hourly_weather.first[:time]).to be_a(String)
      expect(poro.hourly_weather.first[:temperature]).to be_a(Float)
      expect(poro.hourly_weather.first[:conditions]).to be_a(String)
      expect(poro.hourly_weather.first[:icon]).to be_a(String)
    end

  end
end
