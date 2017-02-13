class QuestionResponse < ApplicationRecord
  belongs_to :question_choice
  belongs_to :response

  validates :question_choice, presence: true
  validates :response, presence: true

  delegate :question, to: :question_choice
end
