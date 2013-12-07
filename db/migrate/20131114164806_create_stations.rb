class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :lat
      t.string :lng
      t.integer :station
      t.integer :nextStation
      t.string  :x1
      t.string  :y1
      t.string  :x2
      t.string  :y2
      t.string  :x3
      t.string  :y3
      t.string  :x4
      t.string  :y4


      t.timestamps
    end
  end
end
