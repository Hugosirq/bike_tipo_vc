# frozen_string_literal: true

class Station < ApplicationRecord
  has_paper_trail

  validates :description, :max_lotation, presence: true
  validates :max_lotation, numericality: { only_integer: true }
end
