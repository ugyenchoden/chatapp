# frozen_string_literal: true

module Attributes
  class User < Types::BaseInputObject
    argument :id, ID
    argument :profile, Attributes::Profile, as: :profile_attributes, required: false
  end
end
