require "rails_helper"

RSpec.describe TeleportService do
  describe "instance methods" do
    describe "get_cities" do
      search = TeleportService.new.get_cities("Denver, CO")
      expect(search).to be_a(Hash)
    end


    # first I need the city id
    # with that I can get the city info 
    # with the city info I can get the urban area
    # with the urban area I can get salaries
  end
end