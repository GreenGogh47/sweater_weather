require "rails_helper"

RSpec.describe "Roadtrip API" do
  before :each do
    @user = User.create!(
      id: 1,
      email: "whatever@something.com",
      password: "password",
      password_confirmation: "password",
      api_key: "t1h2i3s4_i5s6_l7e8g9i10t11"
    )

    @params = {
      "origin": "Cincinatti,OH",
      "destination": "Chicago,IL",
      "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
    }
  end

  it "can create a new roadtrip" do
    post "/api/v1/road_trip", params: @params.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(response.body).to include("data")
    expect(response.body).to include("id")
    expect(response.body).to include("type")
    expect(response.body).to include("road_trip")
    expect(response.body).to include("attributes")
    expect(response.body).to include("start_city")
    expect(response.body).to include("end_city")
    expect(response.body).to include("travel_time")
    expect(response.body).to include("weather_at_eta")
    expect(response.body).to include("datetime")
    expect(response.body).to include("temperature")
    expect(response.body).to include("condition")
  end
end