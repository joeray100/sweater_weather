class Api::V1::RoadTripController < ApplicationController
  def create
    origin = params[:origin]
    destination = params[:destination]
    trip = RoadTripFacade.road_trip_search(origin, destination)
    render json: RoadTripSerializer.new(trip)
  end
end
