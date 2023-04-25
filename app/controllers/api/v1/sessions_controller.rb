class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.email == params[:email] && user.password == params[:password]
      render json: UsersSerializer.new(user)
    else
      render json: {error: "Incorrect credentials"}, status: 400
    end
  end
end