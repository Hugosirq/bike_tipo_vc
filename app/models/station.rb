# frozen_string_literal: true

class Station < ApplicationRecord
  validates :description, :max_lotation, presence: true
  validates :max_lotation, numericality: { only_integer: true }

  has_many :bikes, as: :locable
end
