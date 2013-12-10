class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.float :lat
      t.float :long
      t.integer :car_id

      t.timestamps
    end
  end
end
