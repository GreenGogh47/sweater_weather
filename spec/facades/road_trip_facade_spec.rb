require "rails_helper"

RSpec.describe RoadTripFacade do
  describe "class methods" do
    it "#directions" do
      VCR.use_cassette("directions_denver_to_pueblo") do
        road_trip = RoadTripFacade.directions("Denver,CO", "Pueblo,CO")

        expect(road_trip).to be_a(Hash)
        expect(road_trip).to have_key(:route)
        expect(road_trip[:route]).to have_key(:formattedTime)
        expect(road_trip[:route]).to have_key(:realTime)
      end
    end
  end
end