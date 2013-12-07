class Station < ActiveRecord::Base

  def to_api
    "markers=color:green%7Clabel:#{station}%7C#{lat},#{lng}"
  end

  def to_p_maps
    self.to_api + "&"+
    "markers=color:blue%7Clabel:#{station}%7C#{x1},#{y1}&" +
    "markers=color:blue%7Clabel:#{station}%7C#{x2},#{y2}&" +
    "markers=color:blue%7Clabel:#{station}%7C#{x3},#{y3}&" +
    "markers=color:blue%7Clabel:#{station}%7C#{x4},#{y4}&"
  end

  def in_station? x1,y1,x2,y2,x3,y3,x4,y4,px,py
    a1 = Math.sqrt(((x1-x2)**2 + (y1-y2)**2))
    a2 = Math.sqrt(((x2-x3)**2 + (y2-y3)**2))
    a3 = Math.sqrt(((x3-x4)**2 + (y3-y4)**2))
    a4 = Math.sqrt(((x4-x1)**2 + (y4-y1)**2))

    b1 = Math.sqrt(((x1-px)**2 + (y1-py)**2))
    b2 = Math.sqrt(((x2-px)**2 + (y2-py)**2))
    b3 = Math.sqrt(((x3-px)**2 + (y3-py)**2))
    b4 = Math.sqrt(((x4-px)**2 + (y4-py)**2))

    u1 = (a1+b1+b2)/2
    u2 = (a2+b2+b3)/2
    u3 = (a3+b3+b4)/2
    u4 = (a4+b4+b1)/2

    p area1 = Math.sqrt(u1*(u1-a1)*(u1-b1)*(u1-b2))
    p area2 = Math.sqrt(u2*(u2-a2)*(u2-b2)*(u2-b3))
    p area3 = Math.sqrt(u3*(u3-a3)*(u3-b3)*(u3-b4))
    p area4 = Math.sqrt(u4*(u4-a4)*(u4-b4)*(u4-b1))
    p a1*a2
    if a1*a2 == area1 + area2 + area3 + area4
      return true
    else
      return false
    end
  end

end
