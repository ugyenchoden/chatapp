# frozen_string_literal: true

module Attributes
  class Profile < Types::BaseInputObject
    argument :id, ID
    argument :firstname, String, null: true
    argument :lastname, String, null: true
  end
end
