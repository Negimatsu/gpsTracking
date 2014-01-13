class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?



  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def json_request?
    request.format.json?
  end

  def before_station number = Tracking.last.station_id

    dec_tracking = Tracking.order(id: :desc)
    dec_tracking.each do |tracked|
      if (tracked.station_id != number) && (not tracked.station_id.nil?)
        return tracked.station_id
      elsif tracked.station_id.nil?
        return 0
      end

    end

    1
  end


end
