class TeleportService

  def get_salaries(city)
    search = connection.get("urban_areas/slug:#{city}/salaries")
  end


  def get(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://api.teleport.org/api")
  end
end