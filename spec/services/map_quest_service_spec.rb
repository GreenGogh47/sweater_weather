require "rails_helper"

RSpec.describe MapQuestService do
  describe "instance methods" do
    describe "address_to_coordinates" do
      it "#address_to_coordinates" do
        VCR.use_cassette("mapquest_denver_lat_lng") do
          search = MapQuestService.new.address_to_coordinates("Denver, CO")
          expect(search).to be_a(Hash)
          expect(search).to have_key(:info)
          expect(search).to have_key(:results)

          locations = search[:results].first[:locations]
          
          expect(locations).to be_an(Array)
          expect(locations.first).to have_key(:latLng)

          expect(locations.first[:latLng]).to have_key(:lat)
          expect(locations.first[:latLng][:lat]).to eq(39.74001)

          expect(locations.first[:latLng]).to have_key(:lng)
          expect(locations.first[:latLng][:lng]).to eq(-104.99202)
        end
      end
    end
  end
end