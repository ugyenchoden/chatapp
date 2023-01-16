# frozen_string_literal: true

module Users
  class Updater < ApplicationService
    def call
      user.update!(attributes)
    end

    def user
      @_user ||= User.find(attributes[:id])
    end
  end
end
