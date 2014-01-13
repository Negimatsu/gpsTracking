json.array!(@list_stations) do |list_station|
  json.extract! list_station, :list_number, :station_id
  json.url list_station_url(list_station, format: :json)
end
