class HomeController < ApplicationController

  helper :home

  def index
    @users = User.all
    @tracking = Station.find(last_tracked.station_id)
    @car = Car.find(last_tracked.car_id)
    @next_station = Station.find(next_stations)
    current = ListStation.find_all_by_station_id(last_tracked.station_id).first
    @time = current.next_time

  end

  def current_station
    @tracking = Tracking.last
    render :json => @tracking
  end

  def data_stations
    @stations = Station.all
    render :json => @stations
  end

  def color_station
    station = Station.find(params[:id])
    current = Tracking.last
    color = "red"
    if station.in_station? current.lat, current.long
      color = "blue"
    end
    data = { :color => color}
    render :json => data
  end




  private
    def is_late
      lastTrack = Tracking.last

    end

end
