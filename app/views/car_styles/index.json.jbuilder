json.array!(@car_styles) do |car_style|
  json.extract! car_style, :style, :seat
  json.url car_style_url(car_style, format: :json)
end
