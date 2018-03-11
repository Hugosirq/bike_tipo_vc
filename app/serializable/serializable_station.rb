# frozen_string_literal: true

class SerializableStation < JSONAPI::Serializable::Resource
  type :stations

  attributes :description, :address, :neighborhood, :max_capacity

  attribute(:created_at) { I18n.l(@object.created_at, format: :timestamp) }
  attribute(:updated_at) { I18n.l(@object.updated_at, format: :timestamp) }

  has_many :bikes, as: :locable
  has_many :trips, class_name: 'Trip',
                   primary_key: 'id',
                   foreign_key: 'origin_station_id'
  has_many :trips, class_name: 'Trip',
                   primary_key: 'id',
                   foreign_key: 'final_station_id'
end
