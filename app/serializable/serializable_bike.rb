# frozen_string_literal: true

class SerializableBike < JSONAPI::Serializable::Resource
  type :bikes

  attributes :code, :condition_cd, :condition, :locable_type, :locable_id

  attribute(:created_at) { I18n.l(@object.created_at, format: :timestamp) }
  attribute(:updated_at) { I18n.l(@object.updated_at, format: :timestamp) }

  belongs_to :locable, polymorphic: true
end
