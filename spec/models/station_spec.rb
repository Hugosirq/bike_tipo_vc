# frozen_string_literal: true

require 'rails_helper'

describe Station, type: :model do
  describe 'validations' do
    subject { create(:station) }

    context 'when creating' do
      it { expect(subject).to be_valid }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:max_lotation) }
      it { should validate_numericality_of(:max_lotation).only_integer }
    end
  end

  describe 'version' do
    context 'when PaperTrail is related with Station' do
      it { is_expected.to be_versioned }
    end
  end
end