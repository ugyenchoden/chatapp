# frozen_string_literal: true

module Mutations
  class UpdateUser < BaseMutation
    argument :attributes, Attributes::User, required: true
    field :user, Types::UserType, null: true

    def resolve(attributes:)
      super(Users::Updater, :user, attributes: attributes.to_h)
    end
  end
end
