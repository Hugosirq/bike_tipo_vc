class CreateTableBikes < ActiveRecord::Migration[5.1]
  def change
    create_table :bikes do |t|
      t.string :code, null:false
      t.integer :condition_cd, null:false
      t.string :locable_type, null:false
      t.integer :locable_id, null:false
      t.timestamps
    end
  end
end
