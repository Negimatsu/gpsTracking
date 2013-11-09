json.array!(@cars) do |car|
  json.extract! car, :way, :plate
  json.url car_url(car, format: :json)
end
