# frozen_string_literal: true

class SerializableUser < JSONAPI::Serializable::Resource
  type :users

  attributes :name

  attribute(:created_at) { I18n.l(@object.created_at, format: :timestamp) }
  attribute(:updated_at) { I18n.l(@object.updated_at, format: :timestamp) }
end
