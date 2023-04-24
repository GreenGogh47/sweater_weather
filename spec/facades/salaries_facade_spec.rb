require "rails_helper"

RSpec.describe SalariesFacade do
  describe "instance methods" do
    it "salary_info" do
      VCR.use_cassette("facade_chicago_salaries") do
        search = SalariesFacade.salary_info("chicago")

        expect(search).to be_a(Array)
        expect(search.first).to be_a(Hash)

        expect(search.first).to have_key(:title)
        expect(search.first[:title]).to be_a(String)

        expect(search.first).to have_key(:min)
        expect(search.first[:min]).to be_a(Float)

        expect(search.first).to have_key(:max)
        expect(search.first[:max]).to be_a(Float)
      end
    end
  end
end