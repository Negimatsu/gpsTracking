class CreateCarStyles < ActiveRecord::Migration
  def change
    create_table :car_styles do |t|
      t.string :name
      t.integer :seat

      t.timestamps
    end
  end
end
