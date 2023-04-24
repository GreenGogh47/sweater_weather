class TeleportService

  def get_cities
    



  private

  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://api.teleport.org")
  end
end