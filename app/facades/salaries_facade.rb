class SalariesFacade
  
  def self.salary_info(city)
    @service = TeleportService.new.get_salaries(city)
    jobs = ["Data Analyst", "Data Scientist", "Mobile Developer", "QA Engineer", "Software Engineer", "Systems Administrator", "Web Developer"]
    salaries = []
    @service[:salaries].map do |salary|
      if jobs.include?(salary[:job][:title])
        title = salary[:job][:title]
        min = salary[:salary_percentiles][:percentile_75]
        max = salary[:salary_percentiles][:percentile_25]
        salaries << {title: title, min: min, max: max}
      end
    end
    salaries
  end
end