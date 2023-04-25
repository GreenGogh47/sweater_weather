class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(ForecastFacade.forecast(params[:location]))
  end
end