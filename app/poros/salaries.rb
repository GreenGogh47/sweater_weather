class Salaries
  attr_reader :id, :type, :attributes

  def initialize(id = nil, city, forecast, salaries)
    @id = id
    @type = "salaries"
    @attributes = {destination: city, forecast: forecast, salaries: salaries}
  end
end