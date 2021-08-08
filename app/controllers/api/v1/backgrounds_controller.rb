class Api::V1::BackgroundsController < ApplicationController
  def show
    location = params[:location]
    image = BackgroundFacade.background_image(location)
    render json: ImageSerializer.new(image)
  end
end
