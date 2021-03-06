class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy, :show_json] , except: [:data_maps]

  helper :stations

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all :order => :id
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
  end

  def show_json
    render json: @station
  end

  # GET /stations/new
  def new
    @station = Station.new
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render action: 'show', status: :created, location: @station }
      else
        format.html { render action: 'new' }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url }
      format.json { head :no_content }
    end
  end

  def show_maps
    set_station
  end

  def data_maps
    @stations = Station.all
    render :json => @stations
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:name, :lat, :lng, :station, :nextStation, :x1, :y1, :x2, :y2, :x3, :y3, :x4, :y4, :station_normal_pic, :station_current_pic, :station_next_pic)
    end
end
