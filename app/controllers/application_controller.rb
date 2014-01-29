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

  def next_stations
    before_id = before_station
    current_station_id = last_tracked.station_id
    result = []
    if not current_station_id.nil?
      cur_index = ((ListStation.find_all_by_station_id current_station_id)).first.list_number
      before_index = before_id != 0 ? (ListStation.find_by_station_id(before_id)).list_number : 1
      before_before_index = before_id != 0 ? (ListStation.find_by_station_id(before_station before_index)).list_number : 1

      if cur_index == 1
        result.push(ListStation.find_by_station_id(2).station_id)

      elsif cur_index == 2 and cur_index < before_index
        result.push(ListStation.first.station_id)

      else
        (ListStation.find_all_by_list_number(cur_index + 1)).each do |i|
          result.push(i.station_id)
        end
      end
    end
    return result
  end

  def last_tracked
    Tracking.where("Trackings.station_id IS NOT NULL").last
  end

  def overtime? time
    start_time = station_first_track.created_at
    last_time = Time.now
    if last_time - start_time >= time*3
      return 2
    elsif last_time - start_time >= time*2
      return 1
    else
      return 0
    end
  end


  private
  def station_first_track
    current_station = last_tracked.station_id
    latest = Tracking.where("Trackings.station_id IS NOT NULL").last(200)
    latest.reverse!
    latest.each_with_index do |tracking,i|
      if latest[i+1].station_id != current_station and not tracking.station_id.nil?
        return tracking
      end
    end
  end

end
