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
    # config.filter_sensitive_data('<WEATHER_API_KEY>') { ENV['WEATHER_API_KEY']}
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
