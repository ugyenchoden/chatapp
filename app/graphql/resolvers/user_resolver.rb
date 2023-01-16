# frozen_string_literal: true

module Resolvers
  class UserResolver < BaseResolver
    argument :id, ID, required: false
    type Types::UserType, null: true

    def resolve(id: nil)
      return current_user unless id

      ::User.find(id)
    end
  end
end
