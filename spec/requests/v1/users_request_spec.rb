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
    VCR.use_cassette('user_creation') do
      post "/api/v1/users", params: @params.to_json

      require 'pry'; binding.pry

      expect(response).to be_successful
      expect(response.status).to eq(201)
    end
  end
end