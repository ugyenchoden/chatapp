# frozen_string_literal: true

module Types
  class UsersListType < BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :email, String, null: true
    field :role_name, String, null: true
  end
end
