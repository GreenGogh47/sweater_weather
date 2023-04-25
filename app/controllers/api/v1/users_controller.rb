class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      require 'pry'; binding.pry
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end