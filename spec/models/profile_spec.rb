# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile do
  describe 'associations' do
    it { is_expected.to belong_to(:user).inverse_of(:profile) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:firstname) }
    it { is_expected.to validate_presence_of(:lastname) }
  end
end
