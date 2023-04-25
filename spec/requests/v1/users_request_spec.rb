require "rails_helper"

RSpec.describe "Users API" do
  before :each do
    @params = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }

    @params2 = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "passw0rd"
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

  it "can't create a new user if passwords don't match" do
    VCR.use_cassette('user_password_conflict') do
      post "/api/v1/users", params: @params2.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response.status).to eq(400)
      expect(response.body).to include("Password confirmation doesn't match Password")
    end
  end

  it "can't create a new user if email is already taken" do
    VCR.use_cassette('user_email_conflict') do
      post "/api/v1/users", params: @params.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response.status).to eq(201)

      post "/api/v1/users", params: @params2.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response.status).to eq(400)
      expect(response.body).to include("Email has already been taken")
    end
  end
end