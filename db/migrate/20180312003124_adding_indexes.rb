class AddingIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :bikes, :locable_id
    add_index :bikes, :locable_type
    add_index :trips, :user_id
    add_index :trips, :origin_station_id
    add_index :trips, :final_station_id
    add_index :trips, :bike_id
  end
end
