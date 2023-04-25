require "rails_helper"

RSpec.describe TeleportService do
  describe "instance methods" do
    it "get_salaries" do
      VCR.use_cassette("teleport_chicago_salaries") do
        search = TeleportService.new.get_salaries("chicago")
        expect(search).to be_a(Hash)

        expect(search).to have_key(:salaries)
        expect(search[:salaries]).to be_a(Array)
      end
    end
  end
end