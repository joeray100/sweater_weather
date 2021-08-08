class Api::V1::UsersController < ApplicationController
  before_action :generate_api_key

  def create
    user = User.new(user_params)
    user.api_key = @key
    if user.save
      render json: UsersSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def generate_api_key
    @key = SecureRandom.urlsafe_base64(24)
  end
end
