class TrafficJamsController < ApplicationController
  before_action :set_traffic_jam, only: [:show, :edit, :update, :destroy]

  # GET /traffic_jams
  # GET /traffic_jams.json
  def index
    @traffic_jams = TrafficJam.all
  end

  # GET /traffic_jams/1
  # GET /traffic_jams/1.json
  def show
  end

  # GET /traffic_jams/new
  def new
    @traffic_jam = TrafficJam.new
  end

  # GET /traffic_jams/1/edit
  def edit
  end

  # POST /traffic_jams
  # POST /traffic_jams.json
  def create
    @traffic_jam = TrafficJam.new(traffic_jam_params)

    respond_to do |format|
      if @traffic_jam.save
        format.html { redirect_to @traffic_jam, notice: 'Traffic jam was successfully created.' }
        format.json { render action: 'show', status: :created, location: @traffic_jam }
      else
        format.html { render action: 'new' }
        format.json { render json: @traffic_jam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /traffic_jams/1
  # PATCH/PUT /traffic_jams/1.json
  def update
    respond_to do |format|
      if @traffic_jam.update(traffic_jam_params)
        format.html { redirect_to @traffic_jam, notice: 'Traffic jam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @traffic_jam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traffic_jams/1
  # DELETE /traffic_jams/1.json
  def destroy
    @traffic_jam.destroy
    respond_to do |format|
      format.html { redirect_to traffic_jams_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_traffic_jam
    @traffic_jam = TrafficJam.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def traffic_jam_params
    params.require(:traffic_jam).permit(:station_id, :level)
  end

end
