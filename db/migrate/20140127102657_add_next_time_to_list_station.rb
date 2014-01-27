class AddNextTimeToListStation < ActiveRecord::Migration
  def change
    add_column :list_stations, :next_time, :integer
  end
end
