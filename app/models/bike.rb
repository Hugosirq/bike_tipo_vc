# frozen_string_literal: true

class Bike < ApplicationRecord
  validates :code, :condition_cd, :locable_type, :locable_id, presence: true
  validates :locable_id, numericality: { only_integer: true }

  as_enum :condition, %i[broken available], prefix: true
  belongs_to :locable, polymorphic: true
end
