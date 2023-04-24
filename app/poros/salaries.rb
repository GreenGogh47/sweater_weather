class Salaries
  attr_reader :destination, :forecast, :salaries

  def initialize(city, forecast, salaries)
    @destination = city
    @forecast = forecast
    @salaries = salaries
  end
end