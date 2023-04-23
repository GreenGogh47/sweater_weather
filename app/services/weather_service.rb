class WeatherService

  def coordinate_weather(lat, lng)
    get_url("?q=#{lat},#{lng}")
  end

  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "http://api.weatherapi.com/v1/forecast.json") do |f|
      f.params["key"] = ENV["WEATHER_API_KEY"]
    end
  end
end