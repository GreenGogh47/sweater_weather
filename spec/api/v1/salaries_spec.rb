require "rails_helper"

RSpec.describe "Salaries API" do
  before(:each) do

  end

  it "salaries index" do
    VCR.use_cassette("local_api_call") do
      get "/api/v1/salaries?destination=chicago"
      expect(response).to be_successful
      
      salaries = JSON.parse(response.body, symbolize_names: true)
      require 'pry'; binding.pry

      expect(salaries).to be_a(Hash)
      expect(salaries).to have_key(:data)

      data = salaries[:data]
      expect(data).to be_a(Hash)

      expect(data).to have_key(:id)
      expect(data[:id]).to eq(nil)

      expect(data).to have_key(:type)
      expect(data[:type]).to eq("salaries")

      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      attributes = data[:attributes]

      expect(attributes).to have_key(:destination)
      expect(attributes).to have_key(:forecast)
      expect(attributes).to have_key(:salaries)
    end
  end
end