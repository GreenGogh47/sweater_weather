require "rails_helper"

RSpec.describe ForecastFacade do
  describe "instance methods" do
    describe "#coordinates" do
      it "returns coordinates for a given address" do
        VCR.use_cassette("forcast_denver_lat_lng") do
          facade = ForecastFacade.new("Denver,CO")

          expect(search).to be_a(Hash)

          expect(search).to have_key(:lat)
          expect(search[:lat]).to be_a(Float)
          expect(search[:lat]).to eq(39.74001)

          expect(search).to have_key(:lng)
          expect(search[:lng]).to be_a(Float)
          expect(search[:lng]).to eq(-104.99202)
        end
      end
    end
  end
end