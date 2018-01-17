class QuestionChoice < ApplicationRecord
  belongs_to :question
  belongs_to :creative_quality

  validates :text, presence: true
  validates :question, presence: true
  validates :creative_quality, presence: true
  validates :score, numericality: { only_integer: true }
end
