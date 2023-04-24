require "rails_helper"

RSpec.describe SalariesFacade do
  describe "instance methods" do
    it "salary_info" do
      VCR.use_cassette("facade_chicago_salaries") do
        search = SalariesFacade.new("chicago")
        require 'pry'; binding.pry
        expect(search.salary_info).to be_a(Array)
        expect(search.salary_info.first).to be_a(Salary)
      end
    end
  end
end