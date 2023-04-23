require "rails_helper"

RSpec.describe WeatherService do
  describe "instance methods" do
    describe "#weather" do
      it "returns weather for a given set of coordinates" do
        VCR.use_cassette("weather_denver") do
          search = WeatherService.new.coordinate_weather(39.74001, -104.99202)
          expect(search).to be_a(Hash)
          expect(search).to have_key(:current)
          expect(search).to have_key(:location)
        end
      end
    end
  end
end