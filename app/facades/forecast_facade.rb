class ForecastFacade
  attr_reader :forecast

  def self.forecast(location)
    coordinates = MapQuestService.new.address_to_coordinates(location)
    lat_lng = coordinates[:results].first[:locations].first[:latLng]
    weather = WeatherService.new.coordinate_weather(lat_lng[:lat], lat_lng[:lng])

    current_weather = {
      last_updated: weather[:current][:last_updated],
      temperature: weather[:current][:temp_f],
      feels_like: weather[:current][:feelslike_f],
      humidity: weather[:current][:humidity],
      uvi: weather[:current][:uvi],
      visibility: weather[:current][:vis_miles],
      condition: weather[:current][:condition][:text],
      icon: weather[:current][:condition][:icon]
    }

    daily_weather = weather[:forecast][:forecastday].map do |day|
      {
        date: day[:date],
        sunrise: day[:astro][:sunrise],
        sunset: day[:astro][:sunset],
        max_temp: day[:day][:maxtemp_f],
        min_temp: day[:day][:mintemp_f],
        condition: day[:day][:condition][:text],
        icon: day[:day][:condition][:icon]
      }
    end

    hourly_weather = weather[:forecast][:forecastday].each do |day|
      day[:hour].map do |hour|
        {
          time: hour[:time],
          temperature: hour[:temp_f],
          conditions: hour[:condition][:text],
          icon: hour[:condition][:icon]
        }
      end
    end

    @forecast = Forecast.new(current_weather, daily_weather, hourly_weather)
  end
end