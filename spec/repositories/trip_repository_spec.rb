# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TripRepository, type: :repository, vcr: true do
  describe '.create' do
    subject do
      TripRepository.create(trip)
    end

    context 'when sending valid params' do
      let(:origin_station) { create(:station) }
      let(:bike) { create(:bike, locable: origin_station) }
      let!(:trip) { create(:trip, origin_station: origin_station, bike: bike) }

      it 'responds with a TripEntity' do
        expect(subject.class).to eq(TripEntity)
        expect(subject.user_id).to eq(trip.user.id)
        expect(subject.bike_id).to eq(bike.id)
        expect(subject.started_at).to eq(trip.start_date)
        expect(subject.finished_at).to eq(trip.end_date)
        expect(subject.traveled_distance).to eq(trip.meters_distance)
        expect(subject.origin_station_id).to eq(trip.origin_station_id)
        expect(subject.destination_station_id).to eq(trip.final_station_id)
      end
    end
  end
end
