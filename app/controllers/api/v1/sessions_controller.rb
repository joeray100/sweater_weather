class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password]) && user
      session[:user_id] = user.id
      render json: UsersSerializer.new(user)
    end
  end
end
