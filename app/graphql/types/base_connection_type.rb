# frozen_string_literal: true

module Types
  class BaseConnectionType < GraphQL::Types::Relay::BaseConnection
    field :total_count, Integer, null: false

    # - `object` is the Connection
    # - `object.items` is the original collection of Items
    def total_count
      object.items.size
    end
  end
end
