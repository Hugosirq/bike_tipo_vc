# frozen_string_literal: true

FactoryBot.define do
  factory :trip do
    user
    start_date '10/03/2018 20:25:00 +03:00'.to_time
  end
end
