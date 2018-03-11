# frozen_string_literal: true

class Station < ApplicationRecord
  validates :description, :max_lotation, presence: true
  validates :max_lotation, numericality: { only_integer: true }

  has_many :bikes, as: :locable
  has_many :trips, class_name: 'Trip',
                   primary_key: 'id',
                   foreign_key: 'origin_station_id'
  has_many :trips, class_name: 'Trip',
                       primary_key: 'id',
                       foreign_key: 'final_station_id'

end
