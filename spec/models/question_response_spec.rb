require 'rails_helper'

describe QuestionResponse do
  context 'associations' do
    it { is_expected.to belong_to(:question_choice) }
    it { is_expected.to belong_to(:response) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :question_choice }
    it { is_expected.to validate_presence_of :response }
  end
end
