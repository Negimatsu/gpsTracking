module Api
  module Track
    class  Api::Track::TrackingsController < ApplicationController
      before_action :set_tracking, only: [:show, :edit, :update, :destroy]
      respond_to :json

      # GET /trackings
      # GET /trackings.json
      def index
        @trackings = Tracking.all
        respond_with @trackings
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
        respond_with tracking_params.create(tracking_params)
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
    end

  end
end
