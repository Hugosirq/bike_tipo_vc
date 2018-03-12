class CreateTableStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :description, null:false
      t.string :address
      t.string :neighborhood
      t.integer :max_lotation, null:false
      t.timestamps
    end
  end
end
