class AddPicToStations < ActiveRecord::Migration
  def change
    add_column :stations, :station_current_pic, :string
    add_column :stations, :station_next_pic, :string
    add_column :stations, :station_normal_pic, :string
  end
end
