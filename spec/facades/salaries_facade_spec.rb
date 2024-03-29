require "rails_helper"

RSpec.describe SalariesFacade do
  describe "class methods" do
    it "::salary_info" do
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

    it "::current_forecast" do
      VCR.use_cassette("facade_chicago_forecast") do
        search = SalariesFacade.current_forecast("chicago")
        
        expect(search).to be_a(Hash)
        expect(search).to have_key(:summary)
        expect(search).to have_key(:temperature)
      end
    end

    it "::salaries" do
      VCR.use_cassette("facade_chicago_final") do
        facade = SalariesFacade.salaries("chicago")

        expect(facade).to be_a(Salaries)
      end
    end
  end
end