# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role do
  describe 'associations' do
    it { is_expected.to have_many(:users) }
  end

  describe 'validations' do
    before { create(:role, :user) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
end
