# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    subject { create(:user) }

    context 'when creating' do
      it { expect(subject).to be_valid }
      it { should validate_presence_of(:name) }
    end
  end
end
