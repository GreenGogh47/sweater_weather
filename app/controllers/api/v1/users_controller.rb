class Api::V1::UsersController < ApplicationController
  def create
    User.new(user_params)
  end
end