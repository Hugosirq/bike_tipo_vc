# frozen_string_literal: true

require 'rails_helper'

describe Bike, type: :model do
  describe 'validations' do
    subject { create(:station) }

    context 'when creating' do
      it { expect(subject).to be_valid }
      it { should validate_presence_of(:code) }
      it { should validate_presence_of(:condition_cd) }
      it { should validate_presence_of(:locable_type) }
      it { should validate_presence_of(:locable_id) }
      it { should validate_numericality_of(:locable_id).only_integer }
    end
  end
end
