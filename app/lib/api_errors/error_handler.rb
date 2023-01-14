# frozen_string_literal: true

module ApiErrors
  module ErrorHandler
    def self.included(base)
      base.class_eval do
        rescue_from ActiveRecord::ActiveRecordError, with: :active_record_error
        rescue_from StandardError, with: :bad_request
        rescue_from ActionController::ParameterMissing, with: :bad_request
        rescue_from NoMethodError, with: :bad_request
        rescue_from ArgumentError, with: :bad_request
        rescue_from ActionController::MissingFile, with: :file_not_found
      end
    end

    def file_not_found(error)
      render_error(:not_found, [error.message])
    end

    def bad_request(error)
      render_error(:bad_request, [error.message])
    end

    def invalid_resource(record)
      render_error(:unprocessable_entity, record.errors.full_messages)
    end

    def active_record_error(error)
      render_error(:unprocessable_entity, error.record.errors, message: 'Failed to save record.')
    end

    def render_error(status, errors, message = nil)
      render json: { errors: message || errors }, status: status
    end
  end
end
