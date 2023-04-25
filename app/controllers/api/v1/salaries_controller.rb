class Api::V1::SalariesController < ApplicationController
  def index
    render json: SalariesSerializer.new(SalariesFacade.salaries(params[:destination]))
  end
end