# frozen_string_literal: true

class Station < ApplicationRecord
  validates :description, :max_capacity, presence: true
  validates :max_capacity, numericality: { only_integer: true }

  has_many :bikes, as: :locable
  has_many :trips, class_name: 'Trip',
                   primary_key: 'id',
                   foreign_key: 'origin_station_id'
  has_many :trips, class_name: 'Trip',
                   primary_key: 'id',
                   foreign_key: 'final_station_id'

  def free_spots
    all_bikes =  Bike.all.where(locable_type: 'Station', locable_id: id).size
    max_capacity - all_bikes
  end

  def available_bikes
    available_cd = Bike.conditions[:available]
    Bike.all.where(condition_cd: available_cd,
                   locable_type: 'Station',
                   locable_id: id).size
  end
end
