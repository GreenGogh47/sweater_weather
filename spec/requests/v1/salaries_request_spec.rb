require "rails_helper"

RSpec.describe "Salaries API" do
  before(:each) do

  end

  it "salaries index" do
    VCR.use_cassette("local_api_call") do
      get "/api/v1/salaries?destination=chicago"
      expect(response).to be_successful
      
      salaries = JSON.parse(response.body, symbolize_names: true)

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
      expect(attributes[:destination]).to eq("chicago")

      expect(attributes).to have_key(:forecast)
      expect(attributes[:forecast]).to be_a(Hash)
      expect(attributes[:forecast]).to have_key(:summary)
      expect(attributes[:forecast]).to have_key(:temperature)

      expect(attributes).to have_key(:salaries)
      expect(attributes[:salaries]).to be_a(Array)
      expect(attributes[:salaries].first).to be_a(Hash)
      
      salary = attributes[:salaries].first

      expect(salary).to have_key(:title)
      expect(salary).to have_key(:min)
      expect(salary).to have_key(:max)
    end
  end
end