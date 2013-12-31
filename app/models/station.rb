class Station < ActiveRecord::Base
  mount_uploader :station_pic, StationPicUploader

  has_many :trackings

  def in_station? px,py
    x = [self.x1, self.x2, self.x3, self.x4]
    y = [self.y1, self.y2, self.y3, self.y4]
    tri = []
    (0..3).each do |i|
      l_x = [x[i-1], x[i]] + [px]
      l_y = [y[i-1], y[i]] + [py]
      tri = tri + [area_cal(l_x, l_y)]
    end

    sum_tri = sum_area_method(tri)
    area_rec = area_cal(x,y)
    diff = (area_rec - sum_tri).abs

    return diff < 10**-10 #if in area is true
  end


  def to_api
    "markers=color:green%7Clabel:#{(station+64).chr}%7C#{lat},#{lng}"
  end

  def to_p_maps
    self.to_api + "&"+
        "markers=color:blue%7Clabel:1%7C#{x1},#{y1}&" +
        "markers=color:blue%7Clabel:2%7C#{x2},#{y2}&" +
        "markers=color:blue%7Clabel:3%7C#{x3},#{y3}&" +
        "markers=color:blue%7Clabel:4%7C#{x4},#{y4}&"
  end


private

  def area_cal (x, y)
    sum_area = 0
    (1..(x.length-1)).each do |i|
      sum_area = sum_area + (y[i-1]*x[i]) - (y[i]*x[i-1])
    end
    sum_area = sum_area + (x[0]*y[-1])-(x[-1]*y[0])
    area = (sum_area/2).abs

    area
  end

  def sum_area_method(area_list)
    area_list.inject(:+)
  end


end