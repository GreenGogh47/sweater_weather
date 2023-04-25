class Api::V1::SessionsController < ApplicationController
  def create
    render json: UsersSerializer.new(User.find_by(email: params[:email]))
  end
end