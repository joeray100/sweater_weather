require 'rails_helper'

RSpec.describe 'Sessions API' do
  describe 'happy path' do
    it 'A successful request returns the user’s api key.' do
      # Register User
      user_params = {
        "email": "killer.crocs@no.com",
        "password": "lincoln4logs",
        "password_confirmation": "lincoln4logs"
      }
      headers = {"CONTENT_TYPE": "application/json"}
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      # Login User
      login_params = {
        "email": "killer.crocs@no.com",
        "password": "lincoln4logs"
      }
      headers = {"CONTENT_TYPE": "application/json"}
      post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

      reg_user = User.last
      login_user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(login_user).to have_key(:data)
      expect(login_user[:data]).to have_key(:id)
      expect(login_user[:data]).to have_key(:type)
      expect(login_user[:data]).to have_key(:attributes)
      expect(login_user[:data][:attributes]).to have_key(:email)
      expect(login_user[:data][:attributes]).to have_key(:api_key)

      expect(login_user[:data][:attributes][:api_key]).to_not eq(nil)
      expect(login_user[:data][:attributes][:api_key]).to be_a(String)
    end
  end

  describe 'sad path' do
    it 'return error if invalid information is used to login' do
      # Register User
      user_params = {
        "email": "killer.crocs@no.com",
        "password": "lincoln4logs",
        "password_confirmation": "lincoln4logs"
      }
      headers = {"CONTENT_TYPE": "application/json"}
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      # Login User
      login_params = {
        "email": "killer.crocs@no.com",
        "password": "testpassword"
      }
      headers = {"CONTENT_TYPE": "application/json"}
      post '/api/v1/sessions', headers: headers, params: JSON.generate(login_params)

      error_response = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(response).to_not be_successful
      expect(response).to have_http_status(406)
      expect(error_response).to eq('Email or password are invalid')
    end
  end
end
