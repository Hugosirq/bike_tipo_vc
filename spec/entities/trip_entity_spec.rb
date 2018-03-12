# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TripEntity, type: :entity do
  let(:attrs) do
    {
      user_id: 1,
      bike_id: 2,
      started_at: '10/03/2018 20:25:00'.to_time,
      finished_at: '10/03/2018 21:25:00'.to_time,
      traveled_distance: 1000.0,
      origin_station_id: 3,
      destination_station_id: 4
    }
  end

  subject { TripEntity.new(attrs) }

  describe '#initialize' do
    it 'initializes' do
      attrs.each do |key, value|
        expect(subject.send(key)).to eq(value)
      end
    end
  end
end
