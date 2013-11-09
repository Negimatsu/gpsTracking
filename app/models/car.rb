class Car < ActiveRecord::Base

  validates_uniqueness_of :gps_name, :message => "This user has yet a uniqness gps's name"

  belongs_to :car_style
  has_many :tracking_cars

end
