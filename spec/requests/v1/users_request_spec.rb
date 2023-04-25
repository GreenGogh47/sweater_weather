require "rails_helper"

RSpec.describe "Users API" do
  before :each do
    @params = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }
  end
  
  it "can create a new user" do
    VCR.use_cassette('user_creation') do
      post "/api/v1/users", params: @params.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }

      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(response.body).to be_a(String)
      expect(response.body).to include("data")
      expect(response.body).to include("users")
      expect(response.body).to include("email")
      expect(response.body).to include("api_key")

      expect(response.body).to_not include("password")
      expect(response.body).to_not include("password_confirmation")
    end
  end
end