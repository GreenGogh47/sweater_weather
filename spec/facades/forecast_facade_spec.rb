require "rails_helper"

RSpec.describe ForecastFacade do
  describe "instance methods" do
    describe "#coordinates" do
      it "returns coordinates for a given address" do
        VCR.use_cassette("forcast_denver_lat_lng") do
          facade = ForecastFacade.new("Denver,CO")

          expect(facade.forecast).to be_a(Forecast)
          expect(facade.forecast.id).to eq(nil)
          expect(facade.forecast.type).to eq("forecast")

          expect(facade.forecast.current_weather).to be_a(Hash)
          expect(facade.forecast.current_weather).to have_key(:last_updated)

          expect(facade.forecast.daily_weather).to be_a(Array)
          expect(facade.forecast.hourly_weather).to be_a(Array)
        end
      end
    end
  end
end