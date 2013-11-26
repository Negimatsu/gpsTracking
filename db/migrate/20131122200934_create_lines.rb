class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :lat1
      t.string :lng1
      t.string :lat2
      t.string :lng2

      t.timestamps
    end
  end
end
