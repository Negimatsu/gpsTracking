class TrafficJam < ActiveRecord::Base
  belongs_to :station
  validate :can_add

  def can_add
    traffic = TrafficJam.last

    if traffic.station_id == self.station_id
      return  Time.now - traffic.created_at > 3000
    else
      return true
    end
  end

end
