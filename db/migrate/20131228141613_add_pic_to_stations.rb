class AddPicToStations < ActiveRecord::Migration
  def change
    add_column :stations, :station_pic, :string
  end
end
