# frozen_string_literal: true

module Resolvers
  class UsersResolver < SearchObjectBase
    scope do
      User.all
    end

    type Types::UserConnectionType, null: false

    option(:role_ids, type: [String]) { |scope, value| scope.where(role_id: value) }
    option :query, type: String, with: :apply_search, description: <<~DESC
      Supports searches on user's email, firstname, lastname, phone and role
    DESC

    def apply_search(scope, value)
      scope.joins(:profile).where(
        "CONCAT_WS(
          ' ',
          email,
          profiles.firstname,
          profiles.lastname
          )
          iLIKE ?",
        "%#{value.squish}%"
      )
    end
  end
end
