# frozen_string_literal: true

class Trip < ApplicationRecord
  validates :user_id, :origin_station_id, :bike_id, :start_date, presence: true

  has_many :bikes, as: :locable
  belongs_to :user
  belongs_to :bike
  belongs_to :origin_station, class_name: 'Station',
                              foreign_key: 'origin_station_id'
  belongs_to :final_station, class_name: 'Station',
                             foreign_key: 'final_station_id', optional: true
end
