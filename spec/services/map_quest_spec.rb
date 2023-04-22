require "rails_helper"

RSpec.describe MapQuestService do
  describe "instance methods" do
    describe "address_to_coordinates" do
      it "returns coordinates for a given address" do
        search = MapQuestService.new.address_to_coordinates("Denver, CO")

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