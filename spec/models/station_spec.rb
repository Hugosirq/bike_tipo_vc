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
end
