class Question < ApplicationRecord
  has_many :question_choices

  validates :title, presence: true

  accepts_nested_attributes_for(:question_choices)
end
