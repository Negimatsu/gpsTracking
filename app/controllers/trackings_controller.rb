class TrackingsController < ApplicationController
  before_action :set_tracking, only: [:show, :edit, :update, :destroy]

  # GET /trackings
  # GET /trackings.json
  def index
    @trackings = Tracking.all
    #respond_with @trackings
  end

  # GET /trackings/1
  # GET /trackings/1.json
  def show
  end

  # GET /trackings/new
  def new
    @tracking = Tracking.new
  end

  # GET /trackings/1/edit
  def edit
  end

  # POST /trackings
  # POST /trackings.json
  def create
    @tracking = Tracking.new(tracking_params)
    #respond_with tracking_params.create(tracking_params)

    respond_to do |format|
      if @tracking.save
        add_traffic_jam
        format.html { redirect_to @tracking, notice: 'Tracking was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tracking }
      else
        format.html { render action: 'new' }
        format.json { render json: @tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_traffic_jam
    current_station = Station.find(last_tracked.station_id)
    time = ListStation.find_all_by_list_number(current_station).first.next_time
    level = overtime? time
    if level == 1
      traffic = TrafficJam.create(:station_id => current_station.id, level: overtime?(time) )
      traffic.save! if traffic.valid?
    elsif level == 2 and current_station == Tracking.last.station
      last = TrafficJam.last
      if last.station != current_station
        traffic = TrafficJam.create(:station_id => current_station.id, level: overtime?(time) )
        traffic.save
      else
        last.update(level: 2)
        last.save
      end
    end


  end

  # PATCH/PUT /trackings/1
  # PATCH/PUT /trackings/1.json
  def update
    respond_to do |format|
      if @tracking.update(tracking_params)
        format.html { redirect_to @tracking, notice: 'Tracking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackings/1
  # DELETE /trackings/1.json
  def destroy
    @tracking.destroy
    respond_to do |format|
      format.html { redirect_to trackings_url }
      format.json { head :no_content }
    end
  end

  def next_station
    result = next_stations
    render json: result
  end

  def show_route
    current_station = Station.find(last_tracked.station_id)
    next_station = Station.find(next_stations.first)
    time = ListStation.find_all_by_list_number(current_station).first.next_time
    result = {"current" => current_station, "next" => next_station, "color" => color_route(overtime?(time)), "time" => time }
    render json: result

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tracking
    @tracking = Tracking.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tracking_params
    params.require(:tracking).permit(:lat, :long, :car_id)
  end

  def color_route number
    if number == 1
      return "orange"
    elsif number == 2
      return "red"
    else
      return "green"
    end
  end
end
