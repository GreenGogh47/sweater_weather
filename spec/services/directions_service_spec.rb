require "rails_helper"

RSpec.describe DirectionsService do
  describe "instance methods" do
    it "#directions" do
      VCR.use_cassette("directions_denver_to_pueblo") do
        directions = DirectionsService.new.directions("Denver,CO", "Pueblo,CO")

        expect(directions).to be_a(Hash)
        expect(directions).to have_key(:route)
        expect(directions[:route]).to have_key(:formattedTime)
        expect(directions[:route]).to have_key(:realTime)
      end
    end
  end
end