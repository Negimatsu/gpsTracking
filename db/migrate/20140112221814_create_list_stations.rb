class CreateListStations < ActiveRecord::Migration
  def change
    create_table :list_stations do |t|
      t.integer :list_number
      t.integer :station_id

      t.timestamps
    end
  end
end
