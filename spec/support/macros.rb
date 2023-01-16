# frozen_string_literal: true

def json
  RecursiveOpenStruct.new(
    ActiveSupport::HashWithIndifferentAccess.new(
      JSON.parse(response.body)
    )
  )
end

def paginated_collection(node, query_string, current_user: nil)
  response = execute(query_string, current_user: current_user)

  [
    response.dig(:data, node, :edges)&.pluck(:node),
    response[:errors]
  ]
rescue StandardError
  error = response.dig(:errors, 0)

  ap case error.class
     when Hash
       error[:message]
     else
       error
     end
end

def role_ids(roles)
  Role.where(name: roles).pluck(:id)
end

def connection_query(request, response, meta: nil)
  <<~GQL
    query {
      #{request} {
        totalCount
        #{meta}
        edges {
          node {
            #{response}
          }
        }
        pageInfo {
          endCursor
          startCursor
          hasNextPage
          hasPreviousPage
        }
      }
    }
  GQL
end
