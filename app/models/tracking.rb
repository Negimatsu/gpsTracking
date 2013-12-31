class Tracking < ActiveRecord::Base
  belongs_to :car
  belongs_to :station
  before_save :add_station


  private
  def add_station
    unless Tracking.first.nil?
      @stations = Station.all

      @stations.each do |s|
        if s.in_station? lat, long
          self.station = s
          break
        end
      end

    end
  end

end
