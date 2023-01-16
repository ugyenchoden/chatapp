# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  belongs_to :role
  has_one :profile, dependent: :destroy

  validates :profile, presence: true

  accepts_nested_attributes_for :profile, allow_destroy: true

  delegate :name, to: :profile, allow_nil: true
  delegate :name, to: :role, prefix: true
end
