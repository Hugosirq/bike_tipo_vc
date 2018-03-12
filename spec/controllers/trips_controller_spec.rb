# frozen_string_literal: true

require 'rails_helper'

describe TripsController, type: :controller do
  before do
    allow_any_instance_of(TripRepository).
      to receive(:create).and_return(nil)
  end

  let(:origin_station) { create(:station) }
  let(:bike) { create(:bike, locable: origin_station) }
  let!(:trip) { create(:trip, origin_station: origin_station, bike: bike) }

  let(:body) { JSON.parse(response.body) }
  let(:data) { body['data'] }

  describe '#index' do
    let(:data) { body['data'].first }
    before { get :index }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a get with jsonapi with default value of', Trip
  end

  describe '#show' do
    before do
      get :show, params: { id: trip.id }
    end

    it_behaves_like 'a successful get method'
    it_behaves_like 'a get with jsonapi with default value of', Trip
  end

  describe '#create' do
    before { post :create, params: params }

    context 'with valid values' do
      let(:user) { create(:user) }
      let(:params) do
        { trip: attributes_for(:trip).
          merge(
            origin_station_id: origin_station.id,
            bike_id: bike.id,
            user_id: user.id
          ) }
      end

      it_behaves_like 'a successful get method'
      it_behaves_like 'a get with jsonapi with default value of', Trip
    end

    context 'with invalid values' do
      let(:params) do
        {
          trip: {
            start_date: nil
          }
        }
      end

      it { expect(body['errors'].size).to be > 0 }
    end
  end

  describe '#update' do
    let(:final_station_id) { create(:station).id }
    let(:params) do
      {
        id: trip.id,
        trip: {
          final_station_id: final_station_id,
          end_date: '10/03/2018 21:25:00'.to_time,
          extra_minutes: 60,
          pricing: 1.00,
          meters_distance: 100.00
        }
      }
    end

    before { post :update, params: params }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a get with jsonapi with default value of', Trip

    it 'updates' do
      expect(data['attributes']['final_station_id']).to eq(final_station_id)
      expect(data['attributes']['end_date']).
        to eq(I18n.l('10/03/2018 21:25:00'.to_time, format: :timestamp))
      expect(data['attributes']['extra_minutes']).to eq(60)
      expect(data['attributes']['pricing']).to eq('1.0')
      expect(data['attributes']['meters_distance']).to eq('100.0')
    end
  end

  describe '#destroy' do
    let(:params) do
      {
        id: trip.id
      }
    end

    before { delete :destroy, params: params }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a get with jsonapi with default value of', Trip
  end
end
