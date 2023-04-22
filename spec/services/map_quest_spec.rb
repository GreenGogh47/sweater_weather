require "rails_helper"

RSpec.describe MapQuestService do
  describe "instance methods" do
    describe "address_to_coordinates" do
      it "returns coordinates for a given address" do
        VCR.use_cassette("mapquest_denver_lat_lng") do
          search = MapQuestService.new.address_to_coordinates("Denver, CO")
          expect(search).to be_a(Hash)
          expect(search).to have_key(:info)
          expect(search).to have_key(:results)

          require 'pry'; binding.pry

          locations = search[:results][:locations]

          expect(locations).to be_an(Array)
          expect(locations.first).to have_key(:latLng)

          expect(locations.first[:latLng]).to have_key(:lat)
          expect(locations.first[:latLng][:lat]).to eq(39.74001)

          expect(locations.first[:latLng]).to have_key(:lng)
          expect(locations.first[:latLng][:lng]).to eq(-104.99202)
        end
      end
      
      # it "returns coordinates for a given address" do
      #   search = MapQuestService.new.address_to_coordinates("Denver, CO")

      #   expect(search).to be_a(Hash)
        
      #   expect(search).to have_key(:lat)
      #   expect(search[:lat]).to be_a(Float)
      #   expect(search[:lat]).to eq(39.74001)

      #   expect(search).to have_key(:lng)
      #   expect(search[:lng]).to be_a(Float)
      #   expect(search[:lng]).to eq(-104.99202)
      # end
    end
  end
end