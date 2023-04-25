class Forecast
  attr_accessor :id,
                :type,
                :current_weather,
                :daily_weather,
                :hourly_weather

  def initialize(id = nil, type = "forecast", current_weather, daily_weather, hourly_weather)
    @id = id
    @type = type
    @current_weather = current_weather
    @daily_weather = daily_weather
    @hourly_weather = hourly_weather
  end
end
