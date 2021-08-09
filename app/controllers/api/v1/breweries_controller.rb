class Api::V1::BreweriesController < ApplicationController
  def index
    location = params[:location]
    quantity = params[:quantity]
    if quantity.to_i <= 0
      render json: { error: 'Quantity must be higher than 0' }, status: :bad_request
    else
      breweries = BreweriesFacade.breweries_search(location, quantity)
      render json: BreweriesSerializer.new(breweries)
    end
  end
end
