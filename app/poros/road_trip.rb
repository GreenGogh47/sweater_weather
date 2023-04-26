class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(from, to, travel_time, weather)
    @start_city = from
    @end_city = to
    @travel_time = travel_time
    @weather_at_eta = weather
  end
end