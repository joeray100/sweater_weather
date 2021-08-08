require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'happy path' do
    it 'creates a user', :vcr do
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

  # describe 'sad path' do
  #   it '' do
  #     get '/api/v1/'
  #
  #   end
  # end
end
