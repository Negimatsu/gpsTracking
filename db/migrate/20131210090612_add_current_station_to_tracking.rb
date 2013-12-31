class AddCurrentStationToTracking < ActiveRecord::Migration
  def change
    add_column :trackings, :station_id, :integer
  end
end
