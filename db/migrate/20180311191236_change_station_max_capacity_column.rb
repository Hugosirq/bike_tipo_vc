class ChangeStationMaxCapacityColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :stations, :max_lotation, :max_capacity
  end
end
