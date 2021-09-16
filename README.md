# Sweater Weather
This is a back-end application that both consumes and exposes APIs for a potential front-end app to utilize for prospective users. It has the functionality to both register/login a user, display current/future forecasted weather details at a designated location, and supply correlated information in regards to a road trip. Sweater Weather was made with **service-oriented architecture** in mind.

## Table of Contents
| [Title](#sweater-weather)     | [Learning Goals](#learning-goals) |
|:-----------------------------:|:---------------------------------:|
| [Versions](#versions)         | [Setup](#setup)                   |
| [APIs](#apis)                 | [Endpoints](#endpoints)           |
| [Deployment](#deployment)     | [Developer](#developer)           |
---
## Learning Goals
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer

## Versions
[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)
* Ruby 2.7.2
* Rails 5.2.6

## Setup
1. Fork and clone this repo
2. Add any gems you might want to the **Gemfile** then run `bundle install` in your terminal
3. Create and migrate your database by running `rails db:{create,migrate}` in your terminal
4. If you're interested in using a serializer like me then I highly suggest [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)
5. To take advantage of the below APIs you will need to collect API keys from each site.
6. You will then need to store said keys. I chose to store them using the **Figaro** gem.
   * Add ```gem 'figaro'``` to your **Gemfile**
   * Run `bundle install` in your terminal
   * Run ```$ bundle exec figaro install``` in your terminal
   * This will generate `config/application.yml` and be added automatically to your `.gitignore` file
   * You can then add your keys to your file like below
    ```yaml
    # config/application.yml

    MAP_Q_API: <key goes here>
    WEATHER_API: <key goes here>
    UNSPLASH_API: <key goes here>
    ```
    * Then you can call on these evniroment variables in your services like below
    ```ruby
    class WeatherService < BaseService
      class << self
        def retrieve_forecast_data(lat, lon)
          response = conn('https://api.openweathermap.org').get('/data/2.5/onecall?',
            lat: lat,
            lon: lon,
            exclude: 'minutely,alerts',
            units: 'imperial', # For temperature in Fahrenheit and wind speed in miles/hour, use units=imperial

            appid: ENV['WEATHER_API'] < ---- ** See Here **

          )
          parse_json(response)
        end
      end
    end

## APIs

The following are the APIs consumed for this project :

>Map Quest [Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)
>>This is for finding latitude & longitude from a city/state search like `Denver,CO`

>Map Quest [Directions API](https://developer.mapquest.com/documentation/directions-api/)
>>This is used to get directional info based on an **origin** and **destination**

>Open Weather [One Call API](https://openweathermap.org/api/one-call-api)
>>OW is used to gather specific weather information based on a location

>Unsplash [Search photos](https://unsplash.com/documentation#search-photos)
>>This was used to find a background picture from a location search

## Endpoints
The following API endpoints can be used locally via running `rails s` in your terminal and <http://localhost:3000> in your clients URL. To showcase in a production enviroment I've opted to use **Heroku**.

#### Base URL
```
https://sweater-weather-jr.herokuapp.com
```

### 1a. Retrieve weather for a city
#### **GET Request :**
```
https://sweater-weather-jr.herokuapp.com/api/v1/forecast?location=denver,co
```
#### Query Params

| Param Key | Required? |
|:----------|:---------:|
| location  |  Yes      |

#### Response :
```ruby
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2021-08-11 03:12:18 +0000",
        "sunrise": "2021-08-10 12:07:41 +0000",
        "sunset": "2021-08-11 02:02:56 +0000",
        "temperature": 79.09,
        "feels_like": 79.09,
        "humidity": 24,
        "uvi": 0,
        "visibility": 10000,
        "conditions": "scattered clouds",
        "icon": "03n"
      },
      "daily_weather": [
        {
          "date": "2021-08-10",
          "sunrise": "2021-08-10 12:07:41 +0000",
          "sunset": "2021-08-11 02:02:56 +0000",
          "max_temp": 94.71,
          "min_temp": 71.51,
          "conditions": "clear sky",
          "icon": "01d"
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "03:00:00",
          "temperature": 79.09,
          "conditions": "scattered clouds",
          "icon": "03n"
        },
        {
          "time": "04:00:00",
          "temperature": 79.93,
          "conditions": "scattered clouds",
          "icon": "03n"
        },
        {...} etc
        ]
      }
    }
  }
```

### 1b. Background Image for the City
#### **GET Request :**
```
https://sweater-weather-jr.herokuapp.com/api/v1/backgrounds?location=denver,co
```
#### Query Params

| Param Key | Required? |
|:----------|:---------:|
| location  |  Yes      |

#### Response :
```json
{
  "data": {
    "id": null,
    "type": "image",
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://images.unsplash.com/photo-...",
        "credit": {
          "source": "https://unsplash.com",
          "author": "Ryan De Hamer",
          "logo": "https://unsplash.com/photos/QdqK4doOzcQ"
        }
      }
    }
  }
}
```

### 2. User Registration
#### **POST Request :**
```
https://sweater-weather-jr.herokuapp.com/api/v1/users
```
#### JSON Body
```
{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

| Param Key | Required? |
|:----------|:---------:|
| email                 |  Yes      |
| password              |  Yes      |
| password_confirmation |  Yes      |

#### Response :
```ruby
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### 3. Login
#### **POST Request :**
```
https://sweater-weather-jr.herokuapp.com/api/v1/sessions
```
#### JSON Body
```
{
  "email": "whatever@example.com",
  "password": "password"
}
```

| Param Key | Required? |
|:----------|:---------:|
| email     |  Yes      |
| password  |  Yes      |

#### Response :
```ruby
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### 4. Road Trip
#### **POST Request :**
```
https://sweater-weather-jr.herokuapp.com/api/v1/road_trip
```
#### JSON Body
```
{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

| Param Key | Required? |
|:----------|:---------:|
| origin      |  Yes      |
| destination |  Yes      |
| api_key     |  Yes      |

#### Response :
```ruby
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver,CO",
      "end_city": "Pueblo,CO",
      "travel_time": "01:44:22",
      "weather_at_eta": {
        "temperature": 89.73,
        "conditions": "clear sky"
      }
    }
  }
}
```

## Deployment
To deploy in production on Heroku, please execute the following steps.
>In your terminal run the following commands for Heroku CLI

1. Create with directory that contains rails app
`heroku create`
2. Verify remote is running
`git config --list | grep heroku`
3. Deploy code **never push anything but main branch** 
`git push heroku main`
4. If no errors, migrate database 
`heroku run rails db:migrate`
5. Assign one **dyno** running the app
`heroku ps:scale web=1`
6. Check the state of app's dynos
`heroku ps`
7. Open the app in browser
`heroku open`
8. When done using app scale Dyno down
`heroku ps:scale web=0`

For more information please visit [Getting Started on Heroku with Rails 6.x](https://devcenter.heroku.com/articles/getting-started-with-rails6)

## Developer
### Joe Ray
* [LinkedIn](https://www.linkedin.com/in/joe-ray-dev/)
* [GitHub](https://github.com/joeray100)



