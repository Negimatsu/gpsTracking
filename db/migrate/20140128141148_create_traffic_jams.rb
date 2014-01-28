class CreateTrafficJams < ActiveRecord::Migration
  def change
    create_table :traffic_jams do |t|
      t.integer :station_id
      t.integer :level

      t.timestamps
    end
  end
end
