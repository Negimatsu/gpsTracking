json.array!(@traffic_jams) do |traffic_jam|
  json.extract! traffic_jam, :CurrentStation, :NextStation, :level
  json.url traffic_jam_url(traffic_jam, format: :json)
end
