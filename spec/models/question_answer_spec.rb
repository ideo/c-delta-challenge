require 'rails_helper'

describe Answer do
  context 'associations' do
    it { is_expected.to belong_to(:question_choice) }
    it { is_expected.to belong_to(:survey_response) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :question_choice }
    it { is_expected.to validate_presence_of :survey_response }
  end
end
