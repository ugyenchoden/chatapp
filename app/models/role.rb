# frozen_string_literal: true

class Role < ApplicationRecord
  enum name: {
    key_admin: 'Key  Admin',
    user: 'User'
  }

  has_many :users, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
