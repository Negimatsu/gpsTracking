class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :way
      t.string :plate
      t.string :gps_name
      t.integer :car_style_id

      t.timestamps
    end
  end
end
