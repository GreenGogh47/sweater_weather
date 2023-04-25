require "rails_helper"

RSpec.describe RoadTripFacade do
  describe "class methods" do
    it "#directions" do
      VCR.use_cassette("road_trip_facade") do
        road_trip = RoadTripFacade.directions("Denver,CO", "Pueblo,CO")

        expect(road_trip).to have_key(:start_city)
        expect(road_trip).to have_key(:end_city)
        expect(road_trip).to have_key(:travel_time)
        expect(road_trip).to have_key(:weather_at_eta)

        expect(road_trip[:weather_at_eta]).to have_key(:datetime)
        expect(road_trip[:weather_at_eta]).to have_key(:temperature)
        expect(road_trip[:weather_at_eta]).to have_key(:condition)
      end
    end
  end
end