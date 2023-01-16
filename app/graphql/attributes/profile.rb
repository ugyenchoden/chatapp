# frozen_string_literal: true

module Attributes
  class Profile < Types::BaseInputObject
    argument :id, ID
    argument :firstname, String, required: false
    argument :lastname, String, required: false
  end
end
