require "rails_helper"

RSpec.describe Salaries do
  before :each do
    @forecast = {:last_updated=>"2023-04-24 12:15", :temperature=>50.0, :feels_like=>49.4, :humidity=>36, :uvi=>nil, :visibility=>9.0, :condition=>"Partly cloudy", :icon=>"//cdn.weatherapi.com/weather/64x64/day/116.png"}
    @salaries = [{:title=>"Data Analyst", :min=>67929.18726447425, :max=>46898.18614517015},
    {:title=>"Data Scientist", :min=>103647.55438088557, :max=>71025.60310363481},
    {:title=>"Mobile Developer", :min=>79226.91192891626, :max=>50649.8712176599},
    {:title=>"QA Engineer", :min=>69936.64316734018, :max=>46022.824981352605},
    {:title=>"Software Engineer", :min=>100496.16768133474, :max=>67646.2253013339},
    {:title=>"Systems Administrator", :min=>79616.94187484588, :max=>54967.079284456646},
    {:title=>"Web Developer", :min=>82456.50473241684, :max=>53704.53793049536}]
  end

  it "exists" do
    salaries = Salaries.new("chicago", @forecast, @salaries)
    expect(salaries.destination).to eq("chicago")
    expect(salaries.forecast).to eq(@forecast)
    expect(salaries.salaries).to eq(@salaries)
  end
end