# frozen_string_literal: true

def json
  RecursiveOpenStruct.new(
    ActiveSupport::HashWithIndifferentAccess.new(
      JSON.parse(response.body)
    )
  )
end
