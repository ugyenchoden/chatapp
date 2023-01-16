# frozen_string_literal: true

module Types
  class ProfileType < BaseObject
    field :id, ID
    field :firstname, String, null: true
    field :lastname, String, null: true
  end
end
