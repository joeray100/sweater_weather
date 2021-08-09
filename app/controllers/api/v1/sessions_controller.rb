class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password]) && user
      session[:user_id] = user.id
      render json: UsersSerializer.new(user)
    else
      render json: { error: 'Email or password are invalid' }, status: 406
    end
  end
end
