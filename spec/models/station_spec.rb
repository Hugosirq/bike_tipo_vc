# frozen_string_literal: true

require 'rails_helper'

describe Station, type: :model do
  describe 'validations' do
    subject { create(:station) }

    context 'when creating' do
      it { expect(subject).to be_valid }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:max_capacity) }
      it { should validate_numericality_of(:max_capacity).only_integer }
    end
  end

  describe 'class methods' do
    let!(:station) { create(:station, max_capacity: 10) }
    let!(:bike_1) { create(:bike, code: '001', locable: station) }
    let!(:bike_2) { create(:bike, code: '002', locable: station) }
    let!(:bike_3) do
      create(:bike, code: '003', locable: station, condition: :broken)
    end

    context 'available_bikes must be the all the bikes in the current station
             whose condition is available' do

      it { expect(station.available_bikes).to eq(2) }
    end

    context 'free_spots must be the subtraction of max_capacity and
             the available bikes in the station' do

      it { expect(station.free_spots).to eq(7) }
    end
  end
end
