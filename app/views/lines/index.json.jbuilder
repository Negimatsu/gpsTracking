json.array!(@lines) do |line|
  json.extract! line, :lat1, :lng1, :lat2, :lng2
  json.url line_url(line, format: :json)
end
