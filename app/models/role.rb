# frozen_string_literal: true

class Role < ApplicationRecord
  enum name: {
    key_admin: 'Key  Admin',
    user: 'User'
  }

  has_many :users
end
