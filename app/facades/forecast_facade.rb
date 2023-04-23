class ForecastFacade

  def initialize(location)
    coordinates = MapQuestService.new.address_to_coordinates(location)
    lat_lng = coordinates[:results].first[:locations].first[:latLng]
    weather = WeatherService.new.coordinate_weather(lat_lng[:lat], lat_lng[:lng])
    Forecast.new(weather)
  end
end