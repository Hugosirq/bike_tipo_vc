# frozen_string_literal: true

FactoryBot.define do
  factory :trip do
    user
    meters_distance 100.00
    start_date DateTime.new(2018,3,10,20,25,0,'+03:00')
    end_date DateTime.new(2018,3,10,21,25,0,'+03:00')
    extra_minutes 60
    pricing 1.00
  end
end
