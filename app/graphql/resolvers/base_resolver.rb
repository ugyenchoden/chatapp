# frozen_string_literal: true

module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    include ActionPolicy::GraphQL::Behaviour
    include GraphqlHelper
    extend Forwardable

    def_delegator ActiveSupport::Notifications, :instrument
  end
end
