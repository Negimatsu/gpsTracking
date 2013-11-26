class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :lat
      t.string :lng
      t.integer :station
      t.integer :nextStation
      t.integer :line1_id
      t.integer :line2_id

      t.timestamps
    end
  end
end
