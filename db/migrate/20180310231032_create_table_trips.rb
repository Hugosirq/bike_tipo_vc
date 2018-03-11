class CreateTableTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :user_id, null:false
      t.integer :origin_station_id, null:false
      t.integer :final_station_id
      t.integer :bike_id, null:false
      t.decimal :meters_distance, precision: 5, scale: 2
      t.datetime :start_date, null:false
      t.datetime :end_date
      t.integer :extra_minutes
      t.decimal :pricing, precision: 4, scale: 2
      t.timestamps
    end
  end
end
