# frozen_string_literal: true

module Assigner
  def assign_attributes(attributes)
    Hash(attributes).each do |key, value|
      writer_method = "#{key.to_s.underscore}="
      send(writer_method, with_indifferent_access(value)) if respond_to?(writer_method)
    end
  end

  private

  def with_indifferent_access(value)
    value.is_a?(Hash) ? value.with_indifferent_access : value
  end
end
