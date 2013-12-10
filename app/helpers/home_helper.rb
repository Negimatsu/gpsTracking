module HomeHelper

  def get_maps_all
    @stations = Station.all
    if not @stations.nil?
      map = "http://maps.googleapis.com/maps/api/staticmap?&zoom=16&size=800x600&scale=2&maptype=roadmap&"
      @stations.each do |station|
        map += station.to_api + "&"
      end
      map += "sensor=false"
      return map
    end
  end
end
