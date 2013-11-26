json.array!(@trackings) do |tracking|
  json.extract! tracking, :lat, :long, :car_id
  json.url tracking_url(tracking, format: :json)
end
