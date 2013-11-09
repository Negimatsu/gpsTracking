class CarStylesController < ApplicationController
  before_action :set_car_style, only: [:show, :edit, :update, :destroy]

  # GET /car_styles
  # GET /car_styles.json
  def index
    @car_styles = CarStyle.all
  end

  # GET /car_styles/1
  # GET /car_styles/1.json
  def show
  end

  # GET /car_styles/new
  def new
    @car_style = CarStyle.new
  end

  # GET /car_styles/1/edit
  def edit
  end

  # POST /car_styles
  # POST /car_styles.json
  def create
    @car_style = CarStyle.new(car_style_params)

    respond_to do |format|
      if @car_style.save
        format.html { redirect_to @car_style, notice: 'Car style was successfully created.' }
        format.json { render action: 'show', status: :created, location: @car_style }
      else
        format.html { render action: 'new' }
        format.json { render json: @car_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_styles/1
  # PATCH/PUT /car_styles/1.json
  def update
    respond_to do |format|
      if @car_style.update(car_style_params)
        format.html { redirect_to @car_style, notice: 'Car style was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_styles/1
  # DELETE /car_styles/1.json
  def destroy
    @car_style.destroy
    respond_to do |format|
      format.html { redirect_to car_styles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_style
      @car_style = CarStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_style_params
      params.require(:car_style).permit(:name, :seat)
    end
end
