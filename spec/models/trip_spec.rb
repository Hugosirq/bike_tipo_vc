# frozen_string_literal: true

require 'rails_helper'

describe Trip, type: :model do
  describe 'validations' do
    let(:origin_station) { create(:station) }
    let(:bike) { create(:bike, locable: origin_station) }

    context 'when creating' do
      subject do
        create(:trip, origin_station: origin_station,
                      bike: bike)
      end
      it { expect(subject).to be_valid }
      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:origin_station_id) }
      it { should validate_presence_of(:bike_id) }
      it { should validate_presence_of(:start_date) }
    end

    context 'when ending a tip' do
      subject do
        create(:trip, origin_station: origin_station, pricing: 1.00,
                      bike: bike, meters_distance: 100.00, extra_minutes: 60,
                      end_date: '10/03/2018 21:25:00 +03:00'.to_time,
                      final_station: final_station)
      end

      context 'and all ending attributes are present' do
        let(:final_station) { create(:station) }
        it { expect(subject).to be_valid }
      end

      context 'and all ending attributes are not present' do
        let(:final_station) { nil }
        let(:error_message) do
          I18n.t('activerecord.errors.models.trip.attributes.base.' \
            'missing_ending_fields')
        end

        it do
          expect { subject }.
            to raise_error(ActiveRecord::RecordInvalid, /#{error_message}/)
        end
      end
    end
  end
end
