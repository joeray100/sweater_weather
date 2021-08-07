require 'rails_helper'

RSpec.describe "Backgrounds", type: :request do
  describe "GET /api/v1/backgrounds" do
    it "returns http success" do
      get "/backgrounds/api/v1/backgrounds"
      expect(response).to have_http_status(:success)
    end
  end

end
