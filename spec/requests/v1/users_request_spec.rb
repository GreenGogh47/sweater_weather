require "rails_helper"

RSpec.describe "Users API" do
  before :each do
    @params = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }
  end
  
  it "can create a new user" do
    post "/api/v1/users", params: @params

    require 'pry'; binding.pry

    expect(response).to be_successful
    expect(response.status).to eq(201)
    
  end
end