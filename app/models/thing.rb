class Thing < ApplicationRecord
  scope :latest, -> { limit(9) }
end
