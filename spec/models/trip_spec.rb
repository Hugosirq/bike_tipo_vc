# frozen_string_literal: true

require 'rails_helper'

describe Trip, type: :model do
  describe 'validations' do
    let(:origin_station) { create(:station) }
    let(:bike) { create(:bike, locable: origin_station) }

    subject do
      create(:trip, origin_station: origin_station,
                    bike: bike)
    end

    context 'when creating' do
      it { expect(subject).to be_valid }
      it { should validate_presence_of(:user_id) }
      it { should validate_presence_of(:origin_station_id) }
      it { should validate_presence_of(:bike_id) }
      it { should validate_presence_of(:start_date) }
    end
  end
end
