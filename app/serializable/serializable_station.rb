# frozen_string_literal: true

class SerializableStation < JSONAPI::Serializable::Resource
  type :stations

  attributes :description, :address, :neighborhood, :max_lotation

  attribute(:created_at) { I18n.l(@object.created_at, format: :timestamp) }
  attribute(:updated_at) { I18n.l(@object.updated_at, format: :timestamp) }

  has_many :bikes
end
