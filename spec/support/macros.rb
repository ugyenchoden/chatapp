# frozen_string_literal: true

def json
  RecursiveOpenStruct.new(
    ActiveSupport::HashWithIndifferentAccess.new(
      JSON.parse(response.body)
    )
  )
end

def paginated_collection(node, query_string, current_user: nil) # rubocop:disable Metrics/MethodLength
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

def formatted_response(query, current_user: nil, key: nil)
  response = execute(query, current_user: current_user)
  data = response[:data]
  [
    RecursiveOpenStruct.new(key ? data[key] : data),
    response[:errors]
  ]
rescue StandardError
  ap response.dig(:errors, 0, :message) # for easier debugging during failures
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

def query_string(params)
  params.merge!(yield) if block_given?
  return if params.blank?

  array = params.reduce([]) do |arr, param|
    key, value = param
    formatted = value.is_a?(String) ? "\"#{value}\"" : value
    arr << "#{key.to_s.camelize(:lower)}:#{formatted}"
  end

  array.try { |item| "(#{item.join(',')})" }
end

def execute(query, current_user: nil)
  ActiveSupport::HashWithIndifferentAccess.new(
    ChatAppSchema.execute(
      query,
      context: { current_user: current_user, time_zone: Time.zone }
    ).as_json
  )
end
