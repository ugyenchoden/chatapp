# frozen_string_literal: true

module GraphQL
  class ExecutionError < GraphQL::Error
    attr_accessor :error, :record

    def initialize(error)
      super
      @error = error
      @record = error.try(:record)
    end

    def to_h
      if record.nil?
        error
      else
        record.errors.full_messages.to_sentence
      end
    end
  end
end
