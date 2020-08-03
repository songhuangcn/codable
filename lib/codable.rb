require 'codable/railtie'

# Rails plugin for the attribute - code
module Codable
  extend ActiveSupport::Concern

  class_methods do
    attr_accessor :codable_key

    def [](value)
      raise ArgumentError, 'value must be present' unless value.present?

      Rails.cache.fetch("#{_codable_cache_key_prefix}/#{value}") do
        find_by!(codable_key => value)
      end
    end

    def _codable_cache_key_prefix
      "codable/#{table_name}/#{codable_key}"
    end
  end

  included do
    raise ArgumentError, 'Class included must be a ActiveRecord' unless is_a?(Class) && self <= ActiveRecord::Base

    after_commit :_codable_clear_expired_cache, on: %i[update destroy]
    self.codable_key = :code
  end

  def method_missing(method, *args)
    if method.to_s.end_with?('?')
      attributes[self.class.codable_key.to_s] == method.to_s.chomp('?')
    else
      super
    end
  end

  def respond_to_missing?(method, include_private = false)
    method.to_s.end_with?('?') || super
  end

  private

  def _codable_clear_expired_cache
    # When the codable_key field is modified, we need to remove the cache of the original value
    value = attribute_before_last_save(self.class.codable_key.to_s) || attributes[self.class.codable_key.to_s]
    Rails.cache.delete("#{self.class._codable_cache_key_prefix}/#{value}")
  end
end
