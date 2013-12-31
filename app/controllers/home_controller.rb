class HomeController < ApplicationController

  helper :home

  def index
    @users = User.all
    @stations = Station.all
    @tracking = Tracking.last
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
