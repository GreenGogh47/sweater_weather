class Api::V1::SalariesController < ApplicationController
  def index
    render json: SalariesFacade.salaries(params[:destination])
    
  end
end