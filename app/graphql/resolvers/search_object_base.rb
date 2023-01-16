# frozen_string_literal: true

require 'search_object/plugin/graphql'

module Resolvers
  class SearchObjectBase < BaseResolver
    include SearchObject.module(:graphql)

    option(:skip, type: Int) { |scope, value| scope.offset(value) }
  end
end
