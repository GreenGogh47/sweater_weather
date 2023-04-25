class DirectionsService

  def directions(from, to)
    get_url("route?key=#{ENV['MAPQUEST_API_KEY']}&from=#{from}&to=#{to}")
  end
  
  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://www.mapquestapi.com/directions/v2/")
  end
end