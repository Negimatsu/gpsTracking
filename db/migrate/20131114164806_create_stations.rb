class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.integer :station
      t.integer :nextStation
      t.float  :x1
      t.float  :y1
      t.float  :x2
      t.float  :y2
      t.float  :x3
      t.float  :y3
      t.float  :x4
      t.float  :y4


      t.timestamps
    end
  end
end
