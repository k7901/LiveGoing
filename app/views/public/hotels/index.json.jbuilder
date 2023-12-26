json.data do
  json.venue do
     json.id @venue.id
      json.latitude @venue.latitude
      json.longitude @venue.longitude
  end
  json.hotels do
    json.array!(@hotels) do |hotel|
      json.id hotel.id
      json.name hotel.name
      json.introduction hotel.introduction
      json.latitude hotel.latitude
      json.longitude hotel.longitude

    end
  end


end