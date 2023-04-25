require "rails_helper"

RSpec.describe ForecastFacade do
  describe "instance methods" do
    describe "#coordinates" do
      it "returns coordinates for a given address" do
        VCR.use_cassette("forcast_denver_lat_lng") do
          facade = ForecastFacade.forecast("Denver,CO")

          expect(facade).to be_a(Forecast)
          expect(facade.id).to eq(nil)
          expect(facade.type).to eq("forecast")

          expect(facade.current_weather).to be_a(Hash)
          expect(facade.current_weather).to have_key(:last_updated)
          expect(facade.current_weather).to have_key(:temperature)
          expect(facade.current_weather).to have_key(:feels_like)
          expect(facade.current_weather).to have_key(:humidity)
          expect(facade.current_weather).to have_key(:uvi)
          expect(facade.current_weather).to have_key(:visibility)
          expect(facade.current_weather).to have_key(:condition)

          expect(facade.daily_weather).to be_a(Array)
          expect(facade.hourly_weather).to be_a(Array)
        end
      end
    end
  end
end