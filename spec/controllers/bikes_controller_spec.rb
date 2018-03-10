# frozen_string_literal: true

require 'rails_helper'

describe BikesController, type: :controller do
  let!(:station) { create(:station) }
  let!(:bike) { create(:bike, locable: station) }

  let(:body) { JSON.parse(response.body) }
  let(:data) { body['data'] }

  describe '#index' do
    let(:data) { body['data'].first }
    before { get :index }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a json api response with all relations of', Bike
    it_behaves_like 'a get with jsonapi with default value of', Bike
  end

  describe '#show' do
    before do
      get :show, params: { id: bike.id }
    end

    it_behaves_like 'a successful get method'
    it_behaves_like 'a json api response with all relations of', Bike
    it_behaves_like 'a get with jsonapi with default value of', Bike
  end

  describe '#create' do
    before { post :create, params: params }

    context 'with valid values' do
      let(:params) do
        { bike: attributes_for(:bike).merge(locable_id: station.id,
                                            locable_type: :Station) }
      end

      it_behaves_like 'a successful get method'
      it_behaves_like 'a json api response with all relations of', Bike
      it_behaves_like 'a get with jsonapi with default value of', Bike
    end

    context 'with invalid values' do
      let(:params) do
        {
          bike: {
            description: nil
          }
        }
      end

      it { expect(body['errors'].size).to be > 0 }
    end
  end

  describe '#update' do
    let(:new_code) { 'Bike-002' }
    let(:params) do
      {
        id: bike.id,
        bike: {
          code: new_code
        }
      }
    end

    before { post :update, params: params }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a json api response with all relations of', Bike
    it_behaves_like 'a get with jsonapi with default value of', Bike

    it 'updates' do
      expect(data['attributes']['code']).to eq(new_code)
    end
  end

  describe '#destroy' do
    let(:params) do
      {
        id: bike.id
      }
    end

    before { delete :destroy, params: params }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a json api response with all relations of', Bike
    it_behaves_like 'a get with jsonapi with default value of', Bike
  end
end
