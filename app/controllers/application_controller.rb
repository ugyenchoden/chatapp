# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ApiErrors::ErrorHandler
  include DeviseSanitizer

  before_action :authenticate_user!
  before_action :configure_permitted_params, if: :devise_controller?
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.is_a?(Hash) then super
    elsif resource.errors.present? then render json: error_message, status: :unprocessable_entity
    else
      render json: resource
    end
  end

  def error_message
    { errors: resource.errors.full_messages }
  end
end
