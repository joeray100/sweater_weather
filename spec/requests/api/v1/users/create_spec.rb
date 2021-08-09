require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'happy path' do
    it 'creates a user' do
      user_params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
      headers = {"CONTENT_TYPE": "application/json"}
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      data = JSON.parse(response.body, symbolize_names: true)
      user = User.last

      expect(response).to be_successful
      expect(response).to have_http_status(201)
      expect(data[:data][:id].to_i).to eq(user.id)
      expect(data[:data][:attributes][:email]).to eq(user.email)

      expect(data).to have_key(:data)
      expect(data[:data]).to have_key(:id)
      expect(data[:data]).to have_key(:type)
      expect(data[:data]).to have_key(:attributes)
      expect(data[:data][:attributes]).to have_key(:email)
      expect(data[:data][:attributes]).to have_key(:api_key)

      expect(data).to be_a(Hash)
      expect(data[:data]).to be_a(Hash)
      expect(data[:data][:id]).to be_a(String)
      expect(data[:data][:type]).to be_a(String)
      expect(data[:data][:attributes]).to be_a(Hash)
      expect(data[:data][:attributes][:email]).to be_a(String)
      expect(data[:data][:attributes][:api_key]).to be_a(String)

      # The response should NOT include the password in any form
      expect(data[:data][:attributes]).to_not have_key(:password)
      expect(data[:data][:attributes]).to_not have_key(:password_digest)
      expect(response.request.filtered_parameters[:password]).to eq("[FILTERED]")
      expect(response.request.filtered_parameters[:password_confirmation]).to eq("[FILTERED]")
      expect(response.request.filtered_parameters[:password]).to_not eq(user_params[:password])
      expect(response.request.filtered_parameters[:password_confirmation]).to_not eq(user_params[:password_confirmation])
    end
  end

  describe 'sad path' do
    it 'return error if user already exist' do
      user_params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
      headers = {"CONTENT_TYPE": "application/json"}
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      expect(response).to be_successful
      expect(response).to have_http_status(201)

      user_params2 = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }
      headers = {"CONTENT_TYPE": "application/json"}
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params2)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)
      expect(data[:error]).to eq('User already exists, please try again')
    end

    it 'return error if password and password confirmation dont match' do
      user_params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "what?"
      }
      headers = {"CONTENT_TYPE": "application/json"}
      post api_v1_users_path, headers: headers, params: JSON.generate(user_params)

      error_response = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      expect(error_response).to eq("Can not register user, password and password confirmation don't match")
    end

    it 'return error if any required info is missing' do
      # email is missing
      user_params = {
        "email": "",
        "password": "testpass",
        "password_confirmation": "testpass"
      }
      headers = {"CONTENT_TYPE": "application/json"}
      post api_v1_users_path, headers: headers, params: JSON.generate(user_params)

      error_response = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      expect(error_response).to eq('Can not register user, please check the required fields')

      # password & confirmation is missing - if not this way will trigger no match error
      user_params1 = {
        "email": "whatever@example.com",
        "password": "",
        "password_confirmation": ""
      }
      headers = {"CONTENT_TYPE": "application/json"}
      post api_v1_users_path, headers: headers, params: JSON.generate(user_params1)

      error_response1 = JSON.parse(response.body, symbolize_names: true)[:error]

      expect(response).to_not be_successful
      expect(response).to have_http_status(400)
      expect(error_response1).to eq('Can not register user, please check the required fields')
    end
  end
end
