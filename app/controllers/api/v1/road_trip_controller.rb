class Api::V1::RoadTripController < ApplicationController
  def create
    api_key = params[:api_key]
    origin = params[:origin]
    destination = params[:destination]
    trip = RoadTripFacade.road_trip_search(origin, destination)
    render json: RoadTripSerializer.new(trip)
  end
end
