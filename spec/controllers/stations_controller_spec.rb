# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'includes abstract attributes' do
  let(:attributes) { data['attributes'].keys }
  it { expect(attributes).to include('available_bikes', 'free_spots') }
end

describe StationsController, type: :controller do
  let!(:station) { create(:station) }

  let(:body) { JSON.parse(response.body) }
  let(:data) { body['data'] }

  describe '#index' do
    let(:data) { body['data'].first }
    before { get :index }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a json api response with all relations of', Station
    it_behaves_like 'a get with jsonapi with default value of', Station
    it_behaves_like 'includes abstract attributes'
  end

  describe '#show' do
    before do
      get :show, params: { id: station.id }
    end

    it_behaves_like 'a successful get method'
    it_behaves_like 'a json api response with all relations of', Station
    it_behaves_like 'a get with jsonapi with default value of', Station
    it_behaves_like 'includes abstract attributes'
  end

  describe '#create' do
    before { post :create, params: params }

    context 'with valid values' do
      let(:params) do
        { station: attributes_for(:station) }
      end

      it_behaves_like 'a successful get method'
      it_behaves_like 'a json api response with all relations of', Station
      it_behaves_like 'a get with jsonapi with default value of', Station
      it_behaves_like 'includes abstract attributes'
    end

    context 'with invalid values' do
      let(:params) do
        {
          station: {
            description: nil
          }
        }
      end

      it { expect(body['errors'].size).to be > 0 }
    end
  end

  describe '#update' do
    let(:station) { create(:station) }
    let(:new_description) { 'Youse 2.0' }
    let(:params) do
      {
        id: station.id,
        station: {
          description: new_description
        }
      }
    end

    before { post :update, params: params }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a json api response with all relations of', Station
    it_behaves_like 'a get with jsonapi with default value of', Station
    it_behaves_like 'includes abstract attributes'

    it 'updates' do
      expect(data['attributes']['description']).to eq(new_description)
    end
  end

  describe '#destroy' do
    let(:station) { create(:station) }
    let(:params) do
      {
        id: station.id
      }
    end

    before { delete :destroy, params: params }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a json api response with all relations of', Station
    it_behaves_like 'a get with jsonapi with default value of', Station
    it_behaves_like 'includes abstract attributes'
  end
end
