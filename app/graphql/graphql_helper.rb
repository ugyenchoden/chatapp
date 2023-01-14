# frozen_string_literal: true

module GraphqlHelper
  def current_user
    context[:current_user]
  end
end
