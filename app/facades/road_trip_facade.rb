class RoadTripFacade

  def self.directions(params)
    road_trip = DirectionsService.new.directions(params[:origin], params[:destination])
    forecast = ForecastFacade.forecast(params[:destination])
    
    travel_time = road_trip[:route][:time]
    end_time = Time.now + travel_time
    formatted_travel_time = road_trip[:route][:formattedTime]

    forecast.hourly_weather.each do |day|
      day[:hour].each do |time|
        if time[:time].include?(end_time.strftime('%Y-%m-%d'))
          if time[:time].include?("#{end_time.strftime('%H')}:00")
            
            weather = {datetime: formatted_travel_time,
            temperature: time[:temp_f],
            condition: time[:condition][:text]}

            return RoadTrip.new(params[:origin], params[:destination], formatted_travel_time, weather)
          end
        end
      end
    end
  end
end