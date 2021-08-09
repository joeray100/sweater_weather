class Api::V1::UsersController < ApplicationController
  before_action :generate_api_key

  def create
    user = User.new(user_params)
    user.api_key = @key
    if user.password.nil? || user.email.empty? || user.password_confirmation.nil?
      render json: { error: 'Can not register user, please check the required fields' }, status: 400
    elsif user.password != user.password_confirmation
      render json: { error: "Can not register user, password and password confirmation don't match" }, status: 400
    elsif User.find_by(email: user[:email]).present?
      render json: { error: 'User already exists, please try again' }, status: :not_found
    elsif user.save
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
