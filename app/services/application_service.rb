# frozen_string_literal: true

class ApplicationService
  include ActionPolicy::GraphQL::Behaviour
  include ActionView::Helpers::TranslationHelper
  include Rails.application.routes.url_helpers
  include ActiveSupport::Callbacks
  include Assigner

  attr_accessor :attributes, :current_user

  define_callbacks :call

  def initialize(attributes = {})
    assign_attributes(attributes)
  end

  def call
    run_callbacks :call do
      yield if block_given?
    end
  end

  def with_uniqueness_check(class_name)
    ActiveRecord::Base.transaction do
      yield if block_given?
    end
  rescue ActiveRecord::RecordNotUnique
    raise ActiveRecord::RecordNotUnique, "#{class_name.to_s.camelize} has already been taken"
  end
end
