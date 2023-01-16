# frozen_string_literal: true

module Types
  class UserType < BaseObject
    field :id, ID
    field :email, String, null: true
    field :name, String, null: true
    field :role_id, ID
    field :profile, Types::ProfileType, null: true
  end
end
