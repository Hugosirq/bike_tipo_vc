# frozen_string_literal: true

class Trip < ApplicationRecord
  has_many :bikes, as: :locable
  belongs_to :user
  belongs_to :bike
  belongs_to :origin_station, class_name: 'Station',
                              foreign_key: 'origin_station_id'
  belongs_to :final_station, class_name: 'Station',
                             foreign_key: 'final_station_id', optional: true

  validates :user_id, :origin_station_id, :bike_id, :start_date, presence: true

  validate :ending_a_trip, if: 'any_ending_trip_fields_present?'

  validate :bike_condition, on: :create

  def any_ending_trip_fields_present?
    ending_trip_fields.compact.size.positive?
  end

  def ending_a_trip
    if ending_trip_fields.size > ending_trip_fields.compact.size
      errors.add(:base, :missing_ending_fields)
    end

    if final_station.present? && invalid_final_station?
      errors.add(:final_station, :invalid_final_station)
    end

    TripRepository.create(trip) if errors.blank?
  end

  def bike_condition
    errors.add(:bike, :broken_bike) if bike&.condition_broken?
  end

  private

  def invalid_final_station?
    origin_station == final_station
  end

  def ending_trip_fields
    [final_station_id, end_date, extra_minutes, pricing, meters_distance]
  end
end
