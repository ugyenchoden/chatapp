# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test+#{n}@selise.ch" }
    password { 'test123' }

    after(:build) do |user|
      !user.profile && user.profile = build(:profile)
    end

    Role.names.each_key do |name|
      trait name do
        role_id { Role.find_or_create_by!(name: name).id }
      end
    end
  end
end
