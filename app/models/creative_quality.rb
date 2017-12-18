class CreativeQuality < ApplicationRecord
  validates :name, :description, :color, presence: true
end
