require "rails_helper"

RSpec.describe "Roadtrip API" do
  before :each do
    from = "Denver,CO"
    to = "Pueblo,CO"
    travel_time = "01:43:10"
    weather = {:datetime=>"01:43:10", :temperature=>45.1, :condition=>"Light rain shower"}

    @road_trip = RoadTrip.new(from, to, travel_time, weather)
  end

  it "exists" do
    expect(@road_trip).to be_a(RoadTrip)
    expect(@road_trip.start_city).to eq("Denver,CO")
    expect(@road_trip.end_city).to eq("Pueblo,CO")
    expect(@road_trip.travel_time).to eq("01:43:10")
    expect(@road_trip.weather_at_eta).to be_a(Hash)

    end_weather = @road_trip.weather_at_eta
    expect(end_weather[:datetime]).to eq("01:43:10")
    expect(end_weather[:temperature]).to eq(45.1)
    expect(end_weather[:condition]).to eq("Light rain shower")
  end
end