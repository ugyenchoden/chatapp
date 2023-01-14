# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { is_expected.to belong_to(:role) }
    it { is_expected.to have_one(:profile).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:profile) }
  end
end
