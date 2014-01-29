class HomeController < ApplicationController
  helper :home

  def index
    @users = User.all
    @tracking = Station.find(last_tracked.station_id)
    @car = Car.find(last_tracked.car_id)
    @next_station = Station.find(next_stations)
    current = ListStation.find_all_by_station_id(last_tracked.station_id).first
    @time = current.next_time
    all_station = ListStation.where("list_number != 16")
    index_current = all_station.index((all_station.find_by_list_number(current.list_number)))
    @temp_station = all_station[(index_current+1)..all_station.size] + all_station[0..index_current-1]
    @all_station = {}
    @temp_station.each do |s|
      @all_station[Station.find(s.station_id).name] = Station.find(s.station_id).id
    end
  end

  def current_station
    @tracking = last_tracked
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

  def total_time_current_to_select
    select = ListStation.find_all_by_station_id(params[:id]).first
    current = ListStation.find_all_by_station_id(last_tracked.station_id).first
    all_station = ListStation.where("list_number != 16")
    index_current = all_station.index((all_station.find_by_list_number(current.list_number)))
    temp_station = all_station[(index_current)..all_station.size] + all_station[0..index_current-1]
    select_to_station = temp_station[temp_station.index(current)..temp_station.index(select)]
    total_time = 0
    select_to_station.each do |s|
      total_time +=s.next_time
    end
     render :json => total_time
  end

  private
    def is_late
      lastTrack = Tracking.last
    end

end
