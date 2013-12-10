module StationsHelper

  def get_station_maps station

    if not station.nil?
      map = "http://maps.googleapis.com/maps/api/staticmap?&zoom=17&size=800x600&scale=1&maptype=roadmap&"
      map += station.to_p_maps + "&"
      map += "sensor=false"
      return map
    end
  end

  def get_station_all_maps
    @stations = Station.all
    if not @stations.nil?
      map = "http://maps.googleapis.com/maps/api/staticmap?&zoom=17&size=800x600&scale=2&maptype=roadmap&"
      @stations.each do |station|
        map += station.to_p_maps + "&"
      end
      map += "sensor=false"
      return map
    end
  end

end
