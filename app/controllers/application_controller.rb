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

  def before_station number = last_tracked.station_id

    all = Tracking.all
    all.reverse!
    all.each do |tracking|
      if tracking.station_id == number and not tracking.station_id.nil?
         @p_first = Tracking.where("id <= #{tracking.id}").order(id: :desc)

         @p_first.each do |tracking|
           if tracking.station_id != number and not tracking.station_id.nil?
             @dec_tracking = Tracking.where("id <= #{tracking.id}").order(id: :desc)

             @dec_tracking.each do |tracked|
               if (tracked.station_id != number) and not tracked.station_id.nil?
                 return tracked.station_id
               elsif tracked.station_id.nil?
                 return 0
               end
             end

           end
         end

      end
    end
  end

  def last_tracked
    Tracking.find_all_by_station_id(!nil?).last
  end


end
