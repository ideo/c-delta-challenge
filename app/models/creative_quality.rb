class CreativeQuality < ApplicationRecord
  has_many :question_choices

  validates :name, :description, :color, presence: true
end
