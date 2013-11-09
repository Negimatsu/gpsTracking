class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.string :lat
      t.string :long
      t.integer :car_id

      t.timestamps
    end
  end
end
