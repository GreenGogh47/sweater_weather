class Salaries
  attr_reader :id,
              :type,
              :destination,
              :forecast,
              :salaries

  def initialize(id = nil, type = "salaries", city, forecast, salaries)
    @destination = city
    @forecast = forecast
    @salaries = salaries
  end
end