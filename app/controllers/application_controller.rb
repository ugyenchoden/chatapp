# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApiErrors::ErrorHandler
  include DeviseSanitizer

  before_action :authenticate_user!
  before_action :configure_permitted_params, if: :devise_controller?
  respond_to :json
end
