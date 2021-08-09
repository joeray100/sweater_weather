class Api::V1::ForecastController < ApplicationController
  before_action :confirm_location

  def show
    forecast = ForecastFacade.weather_search(@location)
    render json: ForecastSerializer.new(forecast)
  end

  private

  def confirm_location
    @location = params[:location]
    render json: { error: 'No location given' }, status: :not_found if @location.empty?
  end
end
