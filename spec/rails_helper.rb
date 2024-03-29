# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'simplecov'
SimpleCov.start
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  VCR.configure do |config|
    config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    config.hook_into :webmock
    config.filter_sensitive_data('<MAP_Q_API>') { ENV['MAP_Q_API']}
    config.filter_sensitive_data('<WEATHER_API>') { ENV['WEATHER_API']}
    config.filter_sensitive_data('<UNSPLASH_API>') { ENV['UNSPLASH_API']}
    config.default_cassette_options = { re_record_interval: 30.days }
    config.allow_http_connections_when_no_cassette = true
    config.configure_rspec_metadata!
  end
end

def weather_info
  {
      "lat": 39.742,
      "lon": -104.9915,
      "timezone": "America/Denver",
      "timezone_offset": -21600,
      "current": {
          "dt": 1628285388,
          "sunrise": 1628251434,
          "sunset": 1628302065,
          "temp": 87.15,
          "feels_like": 84.58,
          "pressure": 1007,
          "humidity": 28,
          "dew_point": 50.11,
          "uvi": 5.53,
          "clouds": 72,
          "visibility": 10000,
          "wind_speed": 1.01,
          "wind_deg": 180,
          "wind_gust": 3,
          "weather": [
              {
                  "id": 803,
                  "main": "Clouds",
                  "description": "broken clouds",
                  "icon": "04d"
              }
          ]
      },
      "hourly": [
          {
              "dt": 1628283600,
              "temp": 87.15,
              "feels_like": 84.58,
              "pressure": 1007,
              "humidity": 28,
              "dew_point": 50.11,
              "uvi": 5.53,
              "clouds": 72,
              "visibility": 10000,
              "wind_speed": 12.17,
              "wind_deg": 33,
              "wind_gust": 10.65,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628287200,
              "temp": 87.58,
              "feels_like": 84.61,
              "pressure": 1007,
              "humidity": 25,
              "dew_point": 47.46,
              "uvi": 3.07,
              "clouds": 73,
              "visibility": 10000,
              "wind_speed": 17,
              "wind_deg": 337,
              "wind_gust": 17.31,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0.04
          },
          {
              "dt": 1628290800,
              "temp": 87.4,
              "feels_like": 84.34,
              "pressure": 1006,
              "humidity": 24,
              "dew_point": 46.22,
              "uvi": 1.68,
              "clouds": 76,
              "visibility": 10000,
              "wind_speed": 5.82,
              "wind_deg": 7,
              "wind_gust": 11.21,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0.04
          },
          {
              "dt": 1628294400,
              "temp": 87.58,
              "feels_like": 84.31,
              "pressure": 1006,
              "humidity": 22,
              "dew_point": 44.08,
              "uvi": 0.67,
              "clouds": 80,
              "visibility": 10000,
              "wind_speed": 1.48,
              "wind_deg": 199,
              "wind_gust": 8.59,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0.21
          },
          {
              "dt": 1628298000,
              "temp": 82.49,
              "feels_like": 80.53,
              "pressure": 1007,
              "humidity": 26,
              "dew_point": 44.19,
              "uvi": 0.28,
              "clouds": 94,
              "visibility": 10000,
              "wind_speed": 13.2,
              "wind_deg": 172,
              "wind_gust": 15.75,
              "weather": [
                  {
                      "id": 804,
                      "main": "Clouds",
                      "description": "overcast clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0.12
          },
          {
              "dt": 1628301600,
              "temp": 77.31,
              "feels_like": 76.33,
              "pressure": 1007,
              "humidity": 34,
              "dew_point": 46.51,
              "uvi": 0,
              "clouds": 99,
              "visibility": 10000,
              "wind_speed": 10.6,
              "wind_deg": 197,
              "wind_gust": 16.28,
              "weather": [
                  {
                      "id": 804,
                      "main": "Clouds",
                      "description": "overcast clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0.24
          },
          {
              "dt": 1628305200,
              "temp": 77.07,
              "feels_like": 76.12,
              "pressure": 1007,
              "humidity": 35,
              "dew_point": 46.78,
              "uvi": 0,
              "clouds": 73,
              "visibility": 10000,
              "wind_speed": 2.93,
              "wind_deg": 264,
              "wind_gust": 7.96,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04n"
                  }
              ],
              "pop": 0.2
          },
          {
              "dt": 1628308800,
              "temp": 74.03,
              "feels_like": 73.06,
              "pressure": 1009,
              "humidity": 41,
              "dew_point": 48.61,
              "uvi": 0,
              "clouds": 55,
              "visibility": 10000,
              "wind_speed": 14.12,
              "wind_deg": 346,
              "wind_gust": 19.44,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04n"
                  }
              ],
              "pop": 0.2
          },
          {
              "dt": 1628312400,
              "temp": 73.9,
              "feels_like": 72.97,
              "pressure": 1010,
              "humidity": 42,
              "dew_point": 48.76,
              "uvi": 0,
              "clouds": 45,
              "visibility": 10000,
              "wind_speed": 7.78,
              "wind_deg": 335,
              "wind_gust": 14.07,
              "weather": [
                  {
                      "id": 802,
                      "main": "Clouds",
                      "description": "scattered clouds",
                      "icon": "03n"
                  }
              ],
              "pop": 0.16
          },
          {
              "dt": 1628316000,
              "temp": 73.63,
              "feels_like": 72.63,
              "pressure": 1009,
              "humidity": 41,
              "dew_point": 48.18,
              "uvi": 0,
              "clouds": 51,
              "visibility": 10000,
              "wind_speed": 1.81,
              "wind_deg": 20,
              "wind_gust": 3.69,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04n"
                  }
              ],
              "pop": 0.16
          },
          {
              "dt": 1628319600,
              "temp": 73.24,
              "feels_like": 72.23,
              "pressure": 1009,
              "humidity": 42,
              "dew_point": 48.13,
              "uvi": 0,
              "clouds": 8,
              "visibility": 10000,
              "wind_speed": 2.35,
              "wind_deg": 193,
              "wind_gust": 3.53,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628323200,
              "temp": 72.79,
              "feels_like": 71.74,
              "pressure": 1008,
              "humidity": 42,
              "dew_point": 48.04,
              "uvi": 0,
              "clouds": 7,
              "visibility": 10000,
              "wind_speed": 2.33,
              "wind_deg": 238,
              "wind_gust": 3.02,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628326800,
              "temp": 71.87,
              "feels_like": 70.74,
              "pressure": 1008,
              "humidity": 42,
              "dew_point": 47.44,
              "uvi": 0,
              "clouds": 5,
              "visibility": 10000,
              "wind_speed": 4.09,
              "wind_deg": 214,
              "wind_gust": 5.48,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628330400,
              "temp": 70.92,
              "feels_like": 69.67,
              "pressure": 1007,
              "humidity": 42,
              "dew_point": 46.13,
              "uvi": 0,
              "clouds": 4,
              "visibility": 10000,
              "wind_speed": 3,
              "wind_deg": 208,
              "wind_gust": 4.41,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628334000,
              "temp": 69.98,
              "feels_like": 68.56,
              "pressure": 1007,
              "humidity": 40,
              "dew_point": 44.38,
              "uvi": 0,
              "clouds": 4,
              "visibility": 10000,
              "wind_speed": 2.13,
              "wind_deg": 257,
              "wind_gust": 3.15,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628337600,
              "temp": 69.48,
              "feels_like": 67.91,
              "pressure": 1008,
              "humidity": 38,
              "dew_point": 42.4,
              "uvi": 0,
              "clouds": 5,
              "visibility": 10000,
              "wind_speed": 2.64,
              "wind_deg": 225,
              "wind_gust": 2.66,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628341200,
              "temp": 70.29,
              "feels_like": 68.61,
              "pressure": 1009,
              "humidity": 34,
              "dew_point": 40.37,
              "uvi": 0.25,
              "clouds": 2,
              "visibility": 10000,
              "wind_speed": 1.57,
              "wind_deg": 261,
              "wind_gust": 3.94,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628344800,
              "temp": 73.53,
              "feels_like": 71.8,
              "pressure": 1010,
              "humidity": 26,
              "dew_point": 35.82,
              "uvi": 1.01,
              "clouds": 1,
              "visibility": 10000,
              "wind_speed": 3.85,
              "wind_deg": 318,
              "wind_gust": 9.93,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628348400,
              "temp": 77.11,
              "feels_like": 75.42,
              "pressure": 1009,
              "humidity": 19,
              "dew_point": 31.89,
              "uvi": 2.46,
              "clouds": 2,
              "visibility": 10000,
              "wind_speed": 9.31,
              "wind_deg": 302,
              "wind_gust": 12.62,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628352000,
              "temp": 80.15,
              "feels_like": 78.44,
              "pressure": 1009,
              "humidity": 15,
              "dew_point": 28.63,
              "uvi": 4.28,
              "clouds": 3,
              "visibility": 10000,
              "wind_speed": 13.73,
              "wind_deg": 314,
              "wind_gust": 13.49,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628355600,
              "temp": 81.16,
              "feels_like": 79.11,
              "pressure": 1009,
              "humidity": 15,
              "dew_point": 29.48,
              "uvi": 6.3,
              "clouds": 23,
              "visibility": 10000,
              "wind_speed": 11.36,
              "wind_deg": 321,
              "wind_gust": 17.02,
              "weather": [
                  {
                      "id": 801,
                      "main": "Clouds",
                      "description": "few clouds",
                      "icon": "02d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628359200,
              "temp": 84.51,
              "feels_like": 81.48,
              "pressure": 1008,
              "humidity": 13,
              "dew_point": 29.12,
              "uvi": 7.84,
              "clouds": 25,
              "visibility": 10000,
              "wind_speed": 8.79,
              "wind_deg": 327,
              "wind_gust": 17.22,
              "weather": [
                  {
                      "id": 802,
                      "main": "Clouds",
                      "description": "scattered clouds",
                      "icon": "03d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628362800,
              "temp": 87.6,
              "feels_like": 83.91,
              "pressure": 1006,
              "humidity": 12,
              "dew_point": 28.85,
              "uvi": 6.42,
              "clouds": 76,
              "visibility": 10000,
              "wind_speed": 10.49,
              "wind_deg": 304,
              "wind_gust": 18.99,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628366400,
              "temp": 87.94,
              "feels_like": 84.2,
              "pressure": 1006,
              "humidity": 12,
              "dew_point": 29.39,
              "uvi": 5.98,
              "clouds": 88,
              "visibility": 10000,
              "wind_speed": 10.96,
              "wind_deg": 333,
              "wind_gust": 19.37,
              "weather": [
                  {
                      "id": 804,
                      "main": "Clouds",
                      "description": "overcast clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628370000,
              "temp": 88.72,
              "feels_like": 84.83,
              "pressure": 1005,
              "humidity": 12,
              "dew_point": 28.99,
              "uvi": 4.8,
              "clouds": 92,
              "visibility": 10000,
              "wind_speed": 13.29,
              "wind_deg": 343,
              "wind_gust": 19.44,
              "weather": [
                  {
                      "id": 804,
                      "main": "Clouds",
                      "description": "overcast clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628373600,
              "temp": 90.03,
              "feels_like": 85.93,
              "pressure": 1004,
              "humidity": 11,
              "dew_point": 28.72,
              "uvi": 4.11,
              "clouds": 94,
              "visibility": 10000,
              "wind_speed": 14.47,
              "wind_deg": 317,
              "wind_gust": 19.98,
              "weather": [
                  {
                      "id": 804,
                      "main": "Clouds",
                      "description": "overcast clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628377200,
              "temp": 88.93,
              "feels_like": 85.01,
              "pressure": 1004,
              "humidity": 13,
              "dew_point": 32.2,
              "uvi": 2.25,
              "clouds": 80,
              "visibility": 10000,
              "wind_speed": 14.16,
              "wind_deg": 358,
              "wind_gust": 20.36,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628380800,
              "temp": 85.68,
              "feels_like": 82.42,
              "pressure": 1005,
              "humidity": 16,
              "dew_point": 34.93,
              "uvi": 0.9,
              "clouds": 80,
              "visibility": 10000,
              "wind_speed": 13.38,
              "wind_deg": 28,
              "wind_gust": 15.68,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628384400,
              "temp": 85.12,
              "feels_like": 82,
              "pressure": 1005,
              "humidity": 17,
              "dew_point": 35.65,
              "uvi": 0.26,
              "clouds": 7,
              "visibility": 10000,
              "wind_speed": 10.25,
              "wind_deg": 41,
              "wind_gust": 12.86,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628388000,
              "temp": 81.52,
              "feels_like": 79.59,
              "pressure": 1006,
              "humidity": 21,
              "dew_point": 37.98,
              "uvi": 0,
              "clouds": 7,
              "visibility": 10000,
              "wind_speed": 9.71,
              "wind_deg": 64,
              "wind_gust": 11.97,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628391600,
              "temp": 79.03,
              "feels_like": 79.03,
              "pressure": 1008,
              "humidity": 23,
              "dew_point": 38.16,
              "uvi": 0,
              "clouds": 4,
              "visibility": 10000,
              "wind_speed": 6.55,
              "wind_deg": 97,
              "wind_gust": 11.27,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628395200,
              "temp": 77.94,
              "feels_like": 76.55,
              "pressure": 1009,
              "humidity": 24,
              "dew_point": 37.92,
              "uvi": 0,
              "clouds": 5,
              "visibility": 10000,
              "wind_speed": 5.06,
              "wind_deg": 158,
              "wind_gust": 8.43,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628398800,
              "temp": 76.75,
              "feels_like": 75.29,
              "pressure": 1009,
              "humidity": 25,
              "dew_point": 38.14,
              "uvi": 0,
              "clouds": 4,
              "visibility": 10000,
              "wind_speed": 5.03,
              "wind_deg": 192,
              "wind_gust": 9.28,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628402400,
              "temp": 75.4,
              "feels_like": 73.9,
              "pressure": 1009,
              "humidity": 27,
              "dew_point": 38.44,
              "uvi": 0,
              "clouds": 5,
              "visibility": 10000,
              "wind_speed": 5.41,
              "wind_deg": 190,
              "wind_gust": 9.75,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628406000,
              "temp": 74.01,
              "feels_like": 72.43,
              "pressure": 1009,
              "humidity": 28,
              "dew_point": 38.26,
              "uvi": 0,
              "clouds": 55,
              "visibility": 10000,
              "wind_speed": 5.88,
              "wind_deg": 199,
              "wind_gust": 10.47,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628409600,
              "temp": 72.86,
              "feels_like": 71.17,
              "pressure": 1009,
              "humidity": 28,
              "dew_point": 37.99,
              "uvi": 0,
              "clouds": 29,
              "visibility": 10000,
              "wind_speed": 5.23,
              "wind_deg": 200,
              "wind_gust": 9.44,
              "weather": [
                  {
                      "id": 802,
                      "main": "Clouds",
                      "description": "scattered clouds",
                      "icon": "03n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628413200,
              "temp": 71.85,
              "feels_like": 70.05,
              "pressure": 1009,
              "humidity": 28,
              "dew_point": 36.86,
              "uvi": 0,
              "clouds": 20,
              "visibility": 10000,
              "wind_speed": 5.1,
              "wind_deg": 213,
              "wind_gust": 8.63,
              "weather": [
                  {
                      "id": 801,
                      "main": "Clouds",
                      "description": "few clouds",
                      "icon": "02n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628416800,
              "temp": 71.38,
              "feels_like": 69.49,
              "pressure": 1009,
              "humidity": 27,
              "dew_point": 35.47,
              "uvi": 0,
              "clouds": 16,
              "visibility": 10000,
              "wind_speed": 4.52,
              "wind_deg": 230,
              "wind_gust": 7.99,
              "weather": [
                  {
                      "id": 801,
                      "main": "Clouds",
                      "description": "few clouds",
                      "icon": "02n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628420400,
              "temp": 70.61,
              "feels_like": 68.65,
              "pressure": 1009,
              "humidity": 27,
              "dew_point": 35.08,
              "uvi": 0,
              "clouds": 13,
              "visibility": 10000,
              "wind_speed": 3.85,
              "wind_deg": 226,
              "wind_gust": 5.37,
              "weather": [
                  {
                      "id": 801,
                      "main": "Clouds",
                      "description": "few clouds",
                      "icon": "02n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628424000,
              "temp": 70.11,
              "feels_like": 68.13,
              "pressure": 1009,
              "humidity": 28,
              "dew_point": 35.01,
              "uvi": 0,
              "clouds": 11,
              "visibility": 10000,
              "wind_speed": 5.01,
              "wind_deg": 214,
              "wind_gust": 7.47,
              "weather": [
                  {
                      "id": 801,
                      "main": "Clouds",
                      "description": "few clouds",
                      "icon": "02n"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628427600,
              "temp": 70.86,
              "feels_like": 68.92,
              "pressure": 1010,
              "humidity": 27,
              "dew_point": 35.24,
              "uvi": 0.27,
              "clouds": 0,
              "visibility": 10000,
              "wind_speed": 5.23,
              "wind_deg": 216,
              "wind_gust": 8.9,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628431200,
              "temp": 74.91,
              "feels_like": 73.24,
              "pressure": 1010,
              "humidity": 24,
              "dew_point": 35.13,
              "uvi": 1.11,
              "clouds": 0,
              "visibility": 10000,
              "wind_speed": 5.5,
              "wind_deg": 220,
              "wind_gust": 7.61,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628434800,
              "temp": 79.56,
              "feels_like": 79.56,
              "pressure": 1009,
              "humidity": 20,
              "dew_point": 34.93,
              "uvi": 2.74,
              "clouds": 0,
              "visibility": 10000,
              "wind_speed": 5.06,
              "wind_deg": 213,
              "wind_gust": 6.24,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628438400,
              "temp": 84.29,
              "feels_like": 81.39,
              "pressure": 1008,
              "humidity": 17,
              "dew_point": 34.36,
              "uvi": 5.09,
              "clouds": 0,
              "visibility": 10000,
              "wind_speed": 4.34,
              "wind_deg": 202,
              "wind_gust": 5.77,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628442000,
              "temp": 87.58,
              "feels_like": 83.91,
              "pressure": 1007,
              "humidity": 14,
              "dew_point": 33.24,
              "uvi": 7.53,
              "clouds": 0,
              "visibility": 10000,
              "wind_speed": 5.23,
              "wind_deg": 169,
              "wind_gust": 9.64,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628445600,
              "temp": 89.71,
              "feels_like": 85.66,
              "pressure": 1007,
              "humidity": 13,
              "dew_point": 32.58,
              "uvi": 9.38,
              "clouds": 0,
              "visibility": 10000,
              "wind_speed": 7.11,
              "wind_deg": 151,
              "wind_gust": 13.11,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628449200,
              "temp": 91.71,
              "feels_like": 87.37,
              "pressure": 1006,
              "humidity": 12,
              "dew_point": 31.82,
              "uvi": 10.08,
              "clouds": 0,
              "visibility": 10000,
              "wind_speed": 7.94,
              "wind_deg": 140,
              "wind_gust": 15.41,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          },
          {
              "dt": 1628452800,
              "temp": 93.69,
              "feels_like": 89.08,
              "pressure": 1005,
              "humidity": 11,
              "dew_point": 31.28,
              "uvi": 9.38,
              "clouds": 0,
              "visibility": 10000,
              "wind_speed": 8.23,
              "wind_deg": 133,
              "wind_gust": 15.86,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "pop": 0
          }
      ],
      "daily": [
          {
              "dt": 1628276400,
              "sunrise": 1628251434,
              "sunset": 1628302065,
              "moonrise": 1628243400,
              "moonset": 1628299440,
              "moon_phase": 0.94,
              "temp": {
                  "day": 89.71,
                  "min": 71.46,
                  "max": 91.44,
                  "night": 73.9,
                  "eve": 82.49,
                  "morn": 72.25
              },
              "feels_like": {
                  "day": 86.16,
                  "night": 72.97,
                  "eve": 80.53,
                  "morn": 70.54
              },
              "pressure": 1006,
              "humidity": 21,
              "dew_point": 44.62,
              "wind_speed": 17,
              "wind_deg": 337,
              "wind_gust": 19.44,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04d"
                  }
              ],
              "clouds": 83,
              "pop": 0.24,
              "uvi": 9.26
          },
          {
              "dt": 1628362800,
              "sunrise": 1628337890,
              "sunset": 1628388395,
              "moonrise": 1628333400,
              "moonset": 1628388300,
              "moon_phase": 0.97,
              "temp": {
                  "day": 87.6,
                  "min": 69.48,
                  "max": 90.03,
                  "night": 76.75,
                  "eve": 85.12,
                  "morn": 70.29
              },
              "feels_like": {
                  "day": 83.91,
                  "night": 75.29,
                  "eve": 82,
                  "morn": 68.61
              },
              "pressure": 1006,
              "humidity": 12,
              "dew_point": 28.85,
              "wind_speed": 14.47,
              "wind_deg": 317,
              "wind_gust": 20.36,
              "weather": [
                  {
                      "id": 803,
                      "main": "Clouds",
                      "description": "broken clouds",
                      "icon": "04d"
                  }
              ],
              "clouds": 76,
              "pop": 0.16,
              "uvi": 7.84
          },
          {
              "dt": 1628449200,
              "sunrise": 1628424347,
              "sunset": 1628474724,
              "moonrise": 1628423700,
              "moonset": 1628476860,
              "moon_phase": 0,
              "temp": {
                  "day": 91.71,
                  "min": 70.11,
                  "max": 95.49,
                  "night": 82.08,
                  "eve": 91.18,
                  "morn": 70.86
              },
              "feels_like": {
                  "day": 87.37,
                  "night": 79.97,
                  "eve": 86.97,
                  "morn": 68.92
              },
              "pressure": 1006,
              "humidity": 12,
              "dew_point": 31.82,
              "wind_speed": 9.66,
              "wind_deg": 170,
              "wind_gust": 15.86,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "clouds": 0,
              "pop": 0.12,
              "uvi": 10.08
          },
          {
              "dt": 1628535600,
              "sunrise": 1628510805,
              "sunset": 1628561052,
              "moonrise": 1628514120,
              "moonset": 1628565180,
              "moon_phase": 0.04,
              "temp": {
                  "day": 94.08,
                  "min": 73.54,
                  "max": 94.08,
                  "night": 79.63,
                  "eve": 88.99,
                  "morn": 73.54
              },
              "feels_like": {
                  "day": 89.37,
                  "night": 79.63,
                  "eve": 85.1,
                  "morn": 71.55
              },
              "pressure": 1006,
              "humidity": 9,
              "dew_point": 27.09,
              "wind_speed": 15.1,
              "wind_deg": 39,
              "wind_gust": 23.02,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "clouds": 0,
              "pop": 0,
              "uvi": 9.53
          },
          {
              "dt": 1628622000,
              "sunrise": 1628597262,
              "sunset": 1628647378,
              "moonrise": 1628604600,
              "moonset": 1628653260,
              "moon_phase": 0.07,
              "temp": {
                  "day": 89.53,
                  "min": 70.47,
                  "max": 96.91,
                  "night": 86.38,
                  "eve": 95.31,
                  "morn": 70.47
              },
              "feels_like": {
                  "day": 85.51,
                  "night": 82.99,
                  "eve": 90.43,
                  "morn": 68.63
              },
              "pressure": 1010,
              "humidity": 13,
              "dew_point": 32.36,
              "wind_speed": 12.46,
              "wind_deg": 315,
              "wind_gust": 12.86,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "clouds": 0,
              "pop": 0,
              "uvi": 9.71
          },
          {
              "dt": 1628708400,
              "sunrise": 1628683719,
              "sunset": 1628733703,
              "moonrise": 1628695140,
              "moonset": 1628741220,
              "moon_phase": 0.11,
              "temp": {
                  "day": 92.19,
                  "min": 72.57,
                  "max": 96.42,
                  "night": 86.94,
                  "eve": 95.47,
                  "morn": 72.57
              },
              "feels_like": {
                  "day": 87.8,
                  "night": 83.39,
                  "eve": 90.54,
                  "morn": 70.38
              },
              "pressure": 1010,
              "humidity": 7,
              "dew_point": 18.36,
              "wind_speed": 7.34,
              "wind_deg": 117,
              "wind_gust": 17.49,
              "weather": [
                  {
                      "id": 802,
                      "main": "Clouds",
                      "description": "scattered clouds",
                      "icon": "03d"
                  }
              ],
              "clouds": 37,
              "pop": 0,
              "uvi": 10
          },
          {
              "dt": 1628794800,
              "sunrise": 1628770176,
              "sunset": 1628820027,
              "moonrise": 1628785620,
              "moonset": 1628829240,
              "moon_phase": 0.15,
              "temp": {
                  "day": 87.82,
                  "min": 72.9,
                  "max": 92.8,
                  "night": 86.38,
                  "eve": 92.8,
                  "morn": 72.9
              },
              "feels_like": {
                  "day": 84.09,
                  "night": 82.98,
                  "eve": 88.3,
                  "morn": 70.77
              },
              "pressure": 1017,
              "humidity": 13,
              "dew_point": 31.59,
              "wind_speed": 8.21,
              "wind_deg": 14,
              "wind_gust": 14.52,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "clouds": 7,
              "pop": 0,
              "uvi": 10
          },
          {
              "dt": 1628881200,
              "sunrise": 1628856633,
              "sunset": 1628906350,
              "moonrise": 1628876220,
              "moonset": 1628917320,
              "moon_phase": 0.18,
              "temp": {
                  "day": 93.38,
                  "min": 74.41,
                  "max": 99.55,
                  "night": 89.28,
                  "eve": 97.57,
                  "morn": 74.41
              },
              "feels_like": {
                  "day": 88.9,
                  "night": 85.35,
                  "eve": 92.52,
                  "morn": 72.86
              },
              "pressure": 1014,
              "humidity": 13,
              "dew_point": 35.47,
              "wind_speed": 13.24,
              "wind_deg": 54,
              "wind_gust": 18.72,
              "weather": [
                  {
                      "id": 800,
                      "main": "Clear",
                      "description": "clear sky",
                      "icon": "01d"
                  }
              ],
              "clouds": 9,
              "pop": 0,
              "uvi": 10
          }
      ]
  }
end

def image_info
  null = nil
  {
    "total": 5064,
    "total_pages": 5064,
    "results": [
        {
            "id": "A4RpHR83luM",
            "created_at": "2021-05-01T04:12:54-04:00",
            "updated_at": "2021-08-07T03:27:48-04:00",
            "promoted_at": null,
            "width": 5954,
            "height": 3969,
            "color": "#0c2626",
            "blur_hash": "L867}^NGNIxY0gxaxENb==RkWXs,",
            "description": "Night Time Downtown Denver",
            "alt_description": "city skyline during night time",
            "urls": {
                "raw": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyNTIxNjV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2MjgzODIyMDg&ixlib=rb-1.2.1",
                "full": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTIxNjV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2MjgzODIyMDg&ixlib=rb-1.2.1&q=85",
                "regular": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTIxNjV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2MjgzODIyMDg&ixlib=rb-1.2.1&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTIxNjV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2MjgzODIyMDg&ixlib=rb-1.2.1&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTIxNjV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2MjgzODIyMDg&ixlib=rb-1.2.1&q=80&w=200"
            },
            "links": {
                "self": "https://api.unsplash.com/photos/A4RpHR83luM",
                "html": "https://unsplash.com/photos/A4RpHR83luM",
                "download": "https://unsplash.com/photos/A4RpHR83luM/download",
                "download_location": "https://api.unsplash.com/photos/A4RpHR83luM/download?ixid=MnwyNTIxNjV8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2MjgzODIyMDg"
            },
            "categories": [],
            "likes": 4,
            "liked_by_user": false,
            "current_user_collections": [],
            "sponsorship": null,
            "user": {
                "id": "t2RB-3lbgSk",
                "updated_at": "2021-08-07T15:10:31-04:00",
                "username": "rdehamer",
                "name": "Ryan De Hamer",
                "first_name": "Ryan",
                "last_name": "De Hamer",
                "twitter_username": null,
                "portfolio_url": "http://www.dehamermedia.com",
                "bio": "Denver -> Anywhere\r\nMy images are collected all around the country working with brands, athletes and fitness influencers",
                "location": null,
                "links": {
                    "self": "https://api.unsplash.com/users/rdehamer",
                    "html": "https://unsplash.com/@rdehamer",
                    "photos": "https://api.unsplash.com/users/rdehamer/photos",
                    "likes": "https://api.unsplash.com/users/rdehamer/likes",
                    "portfolio": "https://api.unsplash.com/users/rdehamer/portfolio",
                    "following": "https://api.unsplash.com/users/rdehamer/following",
                    "followers": "https://api.unsplash.com/users/rdehamer/followers"
                },
                "profile_image": {
                    "small": "https://images.unsplash.com/profile-1577912636161-6a3ada136470image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                    "medium": "https://images.unsplash.com/profile-1577912636161-6a3ada136470image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                    "large": "https://images.unsplash.com/profile-1577912636161-6a3ada136470image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                },
                "instagram_username": "Ryan_dehamer",
                "total_collections": 6,
                "total_likes": 0,
                "total_photos": 69,
                "accepted_tos": true,
                "for_hire": true,
                "social": {
                    "instagram_username": "Ryan_dehamer",
                    "portfolio_url": "http://www.dehamermedia.com",
                    "twitter_username": null,
                    "paypal_email": null
                }
            },
            "tags": [
                {
                    "type": "search",
                    "title": "denver"
                },
                {
                    "type": "search",
                    "title": "co"
                },
                {
                    "type": "search",
                    "title": "usa"
                }
            ]
        }
    ]
}
end

def route_info
  {
    "route": {
        "hasTollRoad": false,
        "hasBridge": true,
        "boundingBox": {
            "lr": {
                "lng": -104.605087,
                "lat": 38.265427
            },
            "ul": {
                "lng": -104.98761,
                "lat": 39.738453
            }
        },
        "distance": 111.38,
        "hasTimedRestriction": false,
        "hasTunnel": false,
        "hasHighway": true,
        "computedWaypoints": [],
        "routeError": {
            "errorCode": -400,
            "message": ""
        },
        "formattedTime": "01:44:22",
        "sessionId": "61107621-0364-5f21-02b4-3319-0246dfe61b71",
        "hasAccessRestriction": false,
        "realTime": 6610,
        "hasSeasonalClosure": false,
        "hasCountryCross": false,
        "fuelUsed": 5.5,
        "legs": [
            {
                "hasTollRoad": false,
                "hasBridge": true,
                "destNarrative": "Proceed to PUEBLO, CO.",
                "distance": 111.38,
                "hasTimedRestriction": false,
                "hasTunnel": false,
                "hasHighway": true,
                "index": 0,
                "formattedTime": "01:44:22",
                "origIndex": 2,
                "hasAccessRestriction": false,
                "hasSeasonalClosure": false,
                "hasCountryCross": false,
                "roadGradeStrategy": [
                    []
                ],
                "destIndex": 5,
                "time": 6262,
                "hasUnpaved": false,
                "origNarrative": "Go south on N Broadway.",
                "maneuvers": [
                    {
                        "distance": 0.109,
                        "streets": [
                            "N Sherman St"
                        ],
                        "narrative": "Start out going south on N Sherman St toward E 13th Ave.",
                        "turnType": 0,
                        "startPoint": {
                            "lng": -104.984856,
                            "lat": 39.738453
                        },
                        "index": 0,
                        "formattedTime": "00:00:33",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=AWXwRoeAZcBI9dAKwH758um0hnVlQBsH&size=225,160&locations=39.73845291137695,-104.98485565185547|marker-1||39.73687744140625,-104.9848403930664|marker-2||&center=39.7376651763916,-104.98484802246094&defaultMarker=none&zoom=13&rand=144470175&session=61107621-0364-5f21-02b4-3319-0246dfe61b71",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 33,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/icon-dirs-start_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 0.135,
                        "streets": [
                            "E 13th Ave"
                        ],
                        "narrative": "Turn right onto E 13th Ave.",
                        "turnType": 2,
                        "startPoint": {
                            "lng": -104.98484,
                            "lat": 39.736877
                        },
                        "index": 1,
                        "formattedTime": "00:00:22",
                        "directionName": "West",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=AWXwRoeAZcBI9dAKwH758um0hnVlQBsH&size=225,160&locations=39.73687744140625,-104.9848403930664|marker-2||39.73686981201172,-104.98737335205078|marker-3||&center=39.736873626708984,-104.9861068725586&defaultMarker=none&zoom=13&rand=144470175&session=61107621-0364-5f21-02b4-3319-0246dfe61b71",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 22,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_right_sm.gif",
                        "direction": 7
                    },
                    {
                        "distance": 2.485,
                        "streets": [
                            "N Broadway"
                        ],
                        "narrative": "Turn left onto N Broadway.",
                        "turnType": 6,
                        "startPoint": {
                            "lng": -104.987373,
                            "lat": 39.73687
                        },
                        "index": 2,
                        "formattedTime": "00:06:00",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=AWXwRoeAZcBI9dAKwH758um0hnVlQBsH&size=225,160&locations=39.73686981201172,-104.98737335205078|marker-3||39.70085144042969,-104.98760986328125|marker-4||&center=39.7188606262207,-104.98749160766602&defaultMarker=none&zoom=8&rand=144470175&session=61107621-0364-5f21-02b4-3319-0246dfe61b71",
                        "transportMode": "AUTO",
                        "attributes": 1024,
                        "time": 360,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_left_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 0.014,
                        "streets": [],
                        "narrative": "Turn left to take the I-25 S ramp toward Colo Spgs.",
                        "turnType": 13,
                        "startPoint": {
                            "lng": -104.98761,
                            "lat": 39.700851
                        },
                        "index": 3,
                        "formattedTime": "00:00:07",
                        "directionName": "Southeast",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=AWXwRoeAZcBI9dAKwH758um0hnVlQBsH&size=225,160&locations=39.70085144042969,-104.98760986328125|marker-4||39.70073318481445,-104.98739624023438|marker-5||&center=39.70079231262207,-104.98750305175781&defaultMarker=none&zoom=15&rand=144470175&session=61107621-0364-5f21-02b4-3319-0246dfe61b71",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 7,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_ramp_sm.gif",
                        "direction": 5
                    },
                    {
                        "distance": 108.048,
                        "streets": [
                            "I-25 S"
                        ],
                        "narrative": "Merge onto I-25 S.",
                        "turnType": 10,
                        "startPoint": {
                            "lng": -104.987396,
                            "lat": 39.700733
                        },
                        "index": 4,
                        "formattedTime": "01:35:56",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "25",
                                "type": 1,
                                "url": "http://icons.mqcdn.com/icons/rs1.png?n=25&d=SOUTH",
                                "direction": 4
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=AWXwRoeAZcBI9dAKwH758um0hnVlQBsH&size=225,160&locations=39.70073318481445,-104.98739624023438|marker-5||38.27111053466797,-104.60508728027344|marker-6||&center=38.98592185974121,-104.7962417602539&defaultMarker=none&zoom=3&rand=144470175&session=61107621-0364-5f21-02b4-3319-0246dfe61b71",
                        "transportMode": "AUTO",
                        "attributes": 1152,
                        "time": 5756,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_merge_right_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 0.221,
                        "streets": [],
                        "narrative": "Take the 1st Street exit, EXIT 98B.",
                        "turnType": 14,
                        "startPoint": {
                            "lng": -104.605087,
                            "lat": 38.271111
                        },
                        "index": 5,
                        "formattedTime": "00:00:25",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "98B",
                                "type": 1001,
                                "url": "http://icons.mqcdn.com/icons/rs1001.png?n=98B&d=RIGHT",
                                "direction": 0
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=AWXwRoeAZcBI9dAKwH758um0hnVlQBsH&size=225,160&locations=38.27111053466797,-104.60508728027344|marker-6||38.26797103881836,-104.6056137084961|marker-7||&center=38.269540786743164,-104.60535049438477&defaultMarker=none&zoom=11&rand=144470175&session=61107621-0364-5f21-02b4-3319-0246dfe61b71",
                        "transportMode": "AUTO",
                        "attributes": 1024,
                        "time": 25,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_gr_exitright_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 0.078,
                        "streets": [
                            "E 1st St"
                        ],
                        "narrative": "Turn right onto E 1st St.",
                        "turnType": 2,
                        "startPoint": {
                            "lng": -104.605614,
                            "lat": 38.267971
                        },
                        "index": 6,
                        "formattedTime": "00:00:17",
                        "directionName": "West",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=AWXwRoeAZcBI9dAKwH758um0hnVlQBsH&size=225,160&locations=38.26797103881836,-104.6056137084961|marker-7||38.267940521240234,-104.60704803466797|marker-8||&center=38.2679557800293,-104.60633087158203&defaultMarker=none&zoom=15&rand=144470175&session=61107621-0364-5f21-02b4-3319-0246dfe61b71",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 17,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_right_sm.gif",
                        "direction": 7
                    },
                    {
                        "distance": 0.079,
                        "streets": [
                            "W City Center Dr"
                        ],
                        "narrative": "E 1st St becomes W City Center Dr.",
                        "turnType": 0,
                        "startPoint": {
                            "lng": -104.607048,
                            "lat": 38.267941
                        },
                        "index": 7,
                        "formattedTime": "00:00:17",
                        "directionName": "West",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=AWXwRoeAZcBI9dAKwH758um0hnVlQBsH&size=225,160&locations=38.267940521240234,-104.60704803466797|marker-8||38.267913818359375,-104.60850524902344|marker-9||&center=38.267927169799805,-104.6077766418457&defaultMarker=none&zoom=15&rand=144470175&session=61107621-0364-5f21-02b4-3319-0246dfe61b71",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 17,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_straight_sm.gif",
                        "direction": 7
                    },
                    {
                        "distance": 0.211,
                        "streets": [
                            "Central Main St"
                        ],
                        "narrative": "Turn left onto Central Main St.",
                        "turnType": 6,
                        "startPoint": {
                            "lng": -104.608505,
                            "lat": 38.267914
                        },
                        "index": 8,
                        "formattedTime": "00:00:25",
                        "directionName": "Southwest",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=AWXwRoeAZcBI9dAKwH758um0hnVlQBsH&size=225,160&locations=38.267913818359375,-104.60850524902344|marker-9||38.26542663574219,-104.61041259765625|marker-10||&center=38.26667022705078,-104.60945892333984&defaultMarker=none&zoom=12&rand=144470175&session=61107621-0364-5f21-02b4-3319-0246dfe61b71",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 25,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_left_sm.gif",
                        "direction": 6
                    },
                    {
                        "distance": 0,
                        "streets": [],
                        "narrative": "Welcome to PUEBLO, CO.",
                        "turnType": -1,
                        "startPoint": {
                            "lng": -104.610413,
                            "lat": 38.265427
                        },
                        "index": 9,
                        "formattedTime": "00:00:00",
                        "directionName": "",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 0,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/icon-dirs-end_sm.gif",
                        "direction": 0
                    }
                ],
                "hasFerry": false
            }
        ],
        "options": {
            "arteryWeights": [],
            "cyclingRoadFactor": 1,
            "timeType": 0,
            "useTraffic": false,
            "returnLinkDirections": false,
            "countryBoundaryDisplay": true,
            "enhancedNarrative": false,
            "locale": "en_US",
            "tryAvoidLinkIds": [],
            "drivingStyle": 2,
            "doReverseGeocode": true,
            "generalize": -1,
            "mustAvoidLinkIds": [],
            "sideOfStreetDisplay": true,
            "routeType": "FASTEST",
            "avoidTimedConditions": false,
            "routeNumber": 0,
            "shapeFormat": "raw",
            "maxWalkingDistance": -1,
            "destinationManeuverDisplay": true,
            "transferPenalty": -1,
            "narrativeType": "text",
            "walkingSpeed": -1,
            "urbanAvoidFactor": -1,
            "stateBoundaryDisplay": true,
            "unit": "M",
            "highwayEfficiency": 22,
            "maxLinkId": 0,
            "maneuverPenalty": -1,
            "avoidTripIds": [],
            "filterZoneFactor": -1,
            "manmaps": "true"
        },
        "locations": [
            {
                "dragPoint": false,
                "displayLatLng": {
                    "lng": -104.984856,
                    "lat": 39.738453
                },
                "adminArea4": "Denver County",
                "adminArea5": "Denver",
                "postalCode": "",
                "adminArea1": "US",
                "adminArea3": "CO",
                "type": "s",
                "sideOfStreet": "N",
                "geocodeQualityCode": "A5XAX",
                "adminArea4Type": "County",
                "linkId": 40287819,
                "street": "",
                "adminArea5Type": "City",
                "geocodeQuality": "CITY",
                "adminArea1Type": "Country",
                "adminArea3Type": "State",
                "latLng": {
                    "lng": -104.984853,
                    "lat": 39.738453
                }
            },
            {
                "dragPoint": false,
                "displayLatLng": {
                    "lng": -104.610413,
                    "lat": 38.265427
                },
                "adminArea4": "Pueblo County",
                "adminArea5": "Pueblo",
                "postalCode": "",
                "adminArea1": "US",
                "adminArea3": "CO",
                "type": "s",
                "sideOfStreet": "N",
                "geocodeQualityCode": "A5XAX",
                "adminArea4Type": "County",
                "linkId": 54760889,
                "street": "",
                "adminArea5Type": "City",
                "geocodeQuality": "CITY",
                "adminArea1Type": "Country",
                "adminArea3Type": "State",
                "latLng": {
                    "lng": -104.610415,
                    "lat": 38.265425
                }
            }
        ],
        "time": 6262,
        "hasUnpaved": false,
        "locationSequence": [
            0,
            1
        ],
        "hasFerry": false
    },
    "info": {
        "statuscode": 0,
        "copyright": {
            "imageAltText": "© 2021 MapQuest, Inc.",
            "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
            "text": "© 2021 MapQuest, Inc."
        },
        "messages": []
    }
}
end
