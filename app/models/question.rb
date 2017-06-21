class Question < ApplicationRecord
  has_many :choices, class_name: 'QuestionChoice', inverse_of: :question

  validates :title, presence: true

  accepts_nested_attributes_for(:choices)
end
