class SurveyResponse < ApplicationRecord
  has_many :answers

  validates :first_name, presence: true
  validates :last_name, presence: true

  delegate :count, to: :answers, prefix: true

  def display_name
    "#{first_name} #{last_name}"
  end

  def completed?
    answers_count == Question.count
  end
end
