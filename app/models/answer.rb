class Answer < ApplicationRecord
  belongs_to :question_choice
  belongs_to :survey_response

  validates :question_choice, presence: true
  validates :survey_response, presence: true

  delegate :question, to: :question_choice
end
