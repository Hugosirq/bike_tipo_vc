# frozen_string_literal: true

FactoryBot.define do
  factory :bike do
    code 'BIKE-001'
    condition_cd 0
    locable_type 'station'
    locable_id 1
  end
end
