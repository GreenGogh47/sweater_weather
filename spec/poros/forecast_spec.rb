require "rails_helper"

RSpec.describe Forecast do
  before(:each) do
    current_weather={:last_updated=>"2023-04-25 14:00", :temperature=>55.0, :feels_like=>52.1, :humidity=>62, :uvi=>nil, :visibility=>9.0, :condition=>"Overcast", :icon=>"//cdn.weatherapi.com/weather/64x64/day/122.png"}
		daily_weather=[{:date=>"2023-04-25", :sunrise=>"06:09 AM", :sunset=>"07:44 PM", :max_temp=>59.2, :min_temp=>42.3, :condition=>"Moderate rain", :icon=>"//cdn.weatherapi.com/weather/64x64/day/302.png"}]
		hourly_weather= [{:date=>"2023-04-25",
    :date_epoch=>1682380800,
    :day=> {:maxtemp_c=>15.1,
      :maxtemp_f=>59.2,
      :mintemp_c=>5.7,
      :mintemp_f=>42.3,
      :avgtemp_c=>9.7,
      :avgtemp_f=>49.4,
      :maxwind_mph=>18.3,
      :maxwind_kph=>29.5,
      :totalprecip_mm=>15.0,
      :totalprecip_in=>0.59,
      :totalsnow_cm=>0.0,
      :avgvis_km=>9.3,
      :avgvis_miles=>5.0,
      :avghumidity=>72.0,
      :daily_will_it_rain=>1,
      :daily_chance_of_rain=>88,
      :daily_will_it_snow=>0,
      :daily_chance_of_snow=>0,
      :condition=>{:text=>"Moderate rain", :icon=>"//cdn.weatherapi.com/weather/64x64/day/302.png", :code=>1189},
      :uv=>2.0},
    :astro=>{:sunrise=>"06:09 AM", :sunset=>"07:44 PM", :moonrise=>"09:55 AM", :moonset=>"12:52 AM", :moon_phase=>"Waxing Crescent", :moon_illumination=>"24"},
    :hour=> [{:time_epoch=>1682402400,
				:time=>"2023-04-25 00:00",
				:temp_c=>12.3,
				:temp_f=>54.1,
				:is_day=>0,
				:condition=>{:text=>"Clear", :icon=>"//cdn.weatherapi.com/weather/64x64/night/113.png", :code=>1000},
				:wind_mph=>5.1,
				:wind_kph=>8.3,
				:wind_degree=>61,
				:wind_dir=>"ENE",
				:pressure_mb=>1006.0,
				:pressure_in=>29.69,
				:precip_mm=>0.0,
				:precip_in=>0.0,
				:humidity=>51,
				:cloud=>24,
				:feelslike_c=>11.7,
				:feelslike_f=>53.1,
				:windchill_c=>11.7, 
				:windchill_f=>53.1,
				:heatindex_c=>12.3,
				:heatindex_f=>54.1,
				:dewpoint_c=>2.4,
				:dewpoint_f=>36.3,
				:will_it_rain=>0,
				:chance_of_rain=>0,
				:will_it_snow=>0,
				:chance_of_snow=>0,
				:vis_km=>10.0,
				:vis_miles=>6.0,
				:gust_mph=>7.2,
				:gust_kph=>11.5,
				:uv=>1.0}]}]

    @forecast = Forecast.new(current_weather, daily_weather, hourly_weather)
  end

	it "exists" do
		expect(@forecast).to be_a(Forecast)
		expect(@forecast.id).to eq(nil)
		expect(@forecast.type).to eq("forecast")

		expect(@forecast.current_weather).to be_a(Hash)
		expect(@forecast.current_weather).to have_key(:last_updated)
		expect(@forecast.current_weather).to have_key(:temperature)
		expect(@forecast.current_weather).to have_key(:feels_like)
		expect(@forecast.current_weather).to have_key(:humidity)
		expect(@forecast.current_weather).to have_key(:uvi)
		expect(@forecast.current_weather).to have_key(:visibility)
		expect(@forecast.current_weather).to have_key(:condition)

		expect(@forecast.daily_weather).to be_a(Array)
		expect(@forecast.hourly_weather).to be_a(Array)
	end
end