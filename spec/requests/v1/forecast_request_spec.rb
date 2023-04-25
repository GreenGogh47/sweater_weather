require "rails_helper"

RSpec.describe "Forecast API" do
  it "forecast index" do
    VCR.use_cassette("local_forecast_call") do
      get "/api/v1/forecast?location=cincinatti,oh"
      expect(response).to be_successful

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to be_a(Hash)

      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to eq(nil)

      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to eq("forecast")

      expect(forecast[:data]).to have_key(:attributes)

      attributes = forecast[:data][:attributes]

      expect(attributes).to have_key(:current_weather)
      expect(attributes).to have_key(:daily_weather)
      expect(attributes).to have_key(:hourly_weather)
    end
  end
end