require "rails_helper"

RSpec.describe TeleportService do
  describe "instance methods" do
    describe "get_salaries" do
      VCR.use_cassette("teleport_denver_salaries") do
        search = TeleportService.new.get_salaries("denver")
        require 'pry'; binding.pry
        expect(search).to be_a(Hash)
      end
    end


    # Turns out I don't need those 4 endpoints with slug:destination/salaries
  end
end