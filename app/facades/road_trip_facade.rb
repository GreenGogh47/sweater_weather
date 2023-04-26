class RoadTripFacade
  attr_reader :road_trip

  def self.directions(from, to)
    road_trip = DirectionsService.new.directions(from, to)
    forecast = ForecastFacade.forecast(to)
    
    travel_time = road_trip[:route][:time]
    end_time = Time.now + travel_time
    formatted_travel_time = road_trip[:route][:formattedTime]

    forecast.hourly_weather.each do |day|
      day[:hour].each do |time|
        if time[:time].include?(end_time.strftime('%Y-%m-%d'))
          if end_time.strftime('%H') == Time.parse(time[:time]).strftime('%H')
            @road_trip = RoadTrip.new(from, to, formatted_travel_time, time)
          end
        end
      end
    end
  end
end