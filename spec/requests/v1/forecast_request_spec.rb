require "rails_helper"

RSpec.describe "Forecast API" do
  it "forecast index" do
    VCR.use_cassette("local_forecast_call") do
      get "/api/v1/forecast?location=cincinatti,oh"
      expect(response).to be_successful

      

    end
  end
end