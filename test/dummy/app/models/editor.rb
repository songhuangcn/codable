class Editor < ApplicationRecord
  include Codable
  self.codable_key = :key
end
