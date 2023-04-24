class SalariesFacade
  
  def self.salary_info(city)
    service = TeleportService.new.get_salaries(city)
    jobs = ["Data Analyst", "Data Scientist", "Mobile Developer", "QA Engineer", "Software Engineer", "Systems Administrator", "Web Developer"]
    salaries = []
    service[:salaries].map do |salary|
      if jobs.include?(salary[:job][:title])
        title = salary[:job][:title]
        min = salary[:salary_percentiles][:percentile_75]
        max = salary[:salary_percentiles][:percentile_25]
        salaries << {title: title, min: min, max: max}
      end
    end
    salaries
  end

  def self.current_forecast(city)
    weather = ForecastFacade.new(city)
    forecast = weather.forecast.current_weather
    # require 'pry'; binding.pry
    {summary: forecast[:condition], temperature: forecast[:temperature]}
  end

  def self.salaries(city)
    forecast = current_forecast(city)
    salaries = salary_info(city)
    Salaries.new(city, forecast, salaries)
  end
end