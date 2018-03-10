# frozen_string_literal: true

require 'rails_helper'

describe UsersController, type: :controller do
  let!(:user) { create(:user) }

  let(:body) { JSON.parse(response.body) }
  let(:data) { body['data'] }

  describe '#index' do
    let(:data) { body['data'].first }
    before { get :index }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a get with jsonapi with default value of', User
  end

  describe '#show' do
    before do
      get :show, params: { id: user.id }
    end

    it_behaves_like 'a successful get method'
    it_behaves_like 'a get with jsonapi with default value of', User
  end

  describe '#create' do
    before { post :create, params: params }

    context 'with valid values' do
      let(:params) do
        { user: attributes_for(:user) }
      end

      it_behaves_like 'a successful get method'
      it_behaves_like 'a get with jsonapi with default value of', User
    end

    context 'with invalid values' do
      let(:params) do
        {
          user: {
            name: nil
          }
        }
      end

      it { expect(body['errors'].size).to be > 0 }
    end
  end

  describe '#update' do
    let(:user) { create(:user) }
    let(:new_name) { 'Vitor Sirqueira' }
    let(:params) do
      {
        id: user.id,
        user: {
          name: new_name
        }
      }
    end

    before { post :update, params: params }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a get with jsonapi with default value of', User

    it 'updates' do
      expect(data['attributes']['name']).to eq(new_name)
    end
  end

  describe '#destroy' do
    let(:user) { create(:user) }
    let(:params) do
      {
        id: user.id
      }
    end

    before { delete :destroy, params: params }

    it_behaves_like 'a successful get method'
    it_behaves_like 'a get with jsonapi with default value of', User
  end
end
