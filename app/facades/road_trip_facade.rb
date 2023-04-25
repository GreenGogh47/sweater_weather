class RoadTripFacade
  attr_reader :road_trip

  def self.directions(from, to)
    road_trip = DirectionsService.new.directions(from, to)
    forecast = ForecastFacade.forecast(to)
    
    travel_time = Time.parse(road_trip[:route][:formattedTime])
    end_time = Time.now + travel_time

    forecast.hourly_weather.each do |hour|
      time = Time.parse(hour[:time])
      if hour[:time] >= end_time && hour[:time] <= end_time + 1.hour
        @road_trip = RoadTrip.new(from, to, travel_time, hour)
      end
    end
  end
end

# class RoadTripFacade
#   attr_reader :road_trip

#   def self.directions(from, to)
#     road_trip = DirectionsService.new.directions(from, to)
#     travel_time = Time.zone.parse(road_trip[:route][:formattedTime])
#     end_time = Time.zone.now + travel_time
    
#     forecast = ForecastFacade.forecast(to)
    
#     forecast.hourly_weather.each do |hour|
#       time = Time.zone.parse(hour[:time])
#       require 'pry'; binding.pry
#       if time >= end_time && time <= end_time + 1.hour
#         @road_trip = RoadTrip.new(from, to, travel_time, hour)
#       end
#     end
#   end
# end

# I need forecast data for days other than just today.





