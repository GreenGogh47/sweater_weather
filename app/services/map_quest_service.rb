class MapQuestService

  def address_to_coordinates(location)
    get_url("?location=#{location}")
  end

  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/address") do |f|
      f.params["key"] = ENV["MAPQUEST_API_KEY"]
    end
  end
end