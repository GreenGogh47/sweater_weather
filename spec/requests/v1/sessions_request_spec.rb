require "rails_helper"

RSpec.describe "Sessions API" do
  before :each do
    @user = User.create!(id: 1, email: "whatever@something.com", password: "password", password_confirmation: "password")

    @user_params = {email: "whatever@something.com", password: "password"}
    @user_params2 = {email: "whatever@something.com", password: "passw0rd"}
  end

  it "can create a new session" do
    VCR.use_cassette('session_creation') do
      post "/api/v1/sessions", params: @user_params.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      require 'pry'; binding.pry
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(response.body).to include("data")
      expect(response.body).to include("users")
      expect(response.body).to include("id")
      expect(response.body).to include("attributes")
      expect(response.body).to include("email")
      expect(response.body).to include("api_key")
    end
  end

  it "can't create a new session if password is incorrect" do
    post "/api/v1/sessions", params: @user_params2.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }

    expect(response.status).to eq(400)
    expect(response.body).to include("Incorrect credentials")
  end
end