class SalariesFacade
  def initialize(city)
    @service = TeleportService.new.get_salaries(city)
    require 'pry'; binding.pry
  end
end