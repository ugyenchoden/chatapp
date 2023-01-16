# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile

  validates :firstname, :lastname, presence: true

  def name
    [firstname, lastname].join(' ')
  end
end
