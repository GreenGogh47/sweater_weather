require "rails_helper"

RSpec.describe RoadTripFacade do
  describe "class methods" do
    it "#directions" do
      VCR.use_cassette("road_trip_facade") do
        road_trip = RoadTripFacade.directions("Denver,CO", "Pueblo,CO")

        expect(road_trip).to be_a(Array)
        expect(road_trip.first).to be_a(Hash)

        expect(road_trip.first).to have_key(:date)
        expect(road_trip.first).to have_key(:day)

        day = road_trip.first[:day]

        expect(day).to have_key(:maxtemp_f)
        expect(day).to have_key(:mintemp_f)
      end
    end
  end
end