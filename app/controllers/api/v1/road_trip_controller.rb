class Api::V1::RoadTripController < ApplicationController
  def create
    # require 'pry'; binding.pry
    # @user = User.find_by(api_key: road_trip_params[:api_key])
    render json: RoadTripSerializer.new(RoadTripFacade.directions(road_trip_params))
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end