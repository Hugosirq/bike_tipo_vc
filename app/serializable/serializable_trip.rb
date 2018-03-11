# frozen_string_literal: true

class SerializableTrip < JSONAPI::Serializable::Resource
  type :trips

  attributes :user_id, :origin_station_id, :final_station_id, :bike_id,
             :meters_distance, :start_date, :end_date, :extra_minutes, :pricing

  attribute(:created_at) { I18n.l(@object.created_at, format: :timestamp) }
  attribute(:updated_at) { I18n.l(@object.updated_at, format: :timestamp) }
  attribute(:start_date) do
    I18n.l(@object.start_date, format: :timestamp) if @object.start_date
  end

  attribute(:end_date) do
    I18n.l(@object.end_date, format: :timestamp) if @object.end_date
  end

  has_many :bikes, as: :locable
  belongs_to :user
  belongs_to :bike
  belongs_to :origin_station, class_name: 'Station',
                              foreign_key: 'origin_station_id'
  belongs_to :final_station, class_name: 'Station',
                             foreign_key: 'final_station_id', optional: true
end
