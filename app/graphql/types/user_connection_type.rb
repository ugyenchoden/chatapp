# frozen_string_literal: true

module Types
  class UserConnectionType < BaseConnectionType
    edge_type(Types::UserEdgeType)
  end
end
