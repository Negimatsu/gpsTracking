class ListStationsController < ApplicationController
  before_action :set_list_station, only: [:show, :edit, :update, :destroy]

  # GET /list_stations
  # GET /list_stations.json
  def index
    @list_stations = ListStation.all :order => :list_number
  end

  # GET /list_stations/1
  # GET /list_stations/1.json
  def show
  end

  # GET /list_stations/new
  def new
    @list_station = ListStation.new
  end

  # GET /list_stations/1/edit
  def edit
  end

  # POST /list_stations
  # POST /list_stations.json
  def create
    @list_station = ListStation.new(list_station_params)

    respond_to do |format|
      if @list_station.save
        format.html { redirect_to @list_station, notice: 'List station was successfully created.' }
        format.json { render action: 'show', status: :created, location: @list_station }
      else
        format.html { render action: 'new' }
        format.json { render json: @list_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_stations/1
  # PATCH/PUT /list_stations/1.json
  def update
    respond_to do |format|
      if @list_station.update(list_station_params)
        format.html { redirect_to @list_station, notice: 'List station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @list_station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_stations/1
  # DELETE /list_stations/1.json
  def destroy
    @list_station.destroy
    respond_to do |format|
      format.html { redirect_to list_stations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_station
      @list_station = ListStation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_station_params
      params.require(:list_station).permit(:list_number, :station_id, :next_time)
    end
end
