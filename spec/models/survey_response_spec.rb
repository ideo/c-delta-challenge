require 'rails_helper'

describe SurveyResponse do
  context 'associations' do
    it { is_expected.to have_many(:answers) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  describe '#display_name' do
    let(:survey_response) { create(:survey_response) }

    it 'concatenates the first and last name' do
      expect(survey_response.display_name).to eql(
        [
          survey_response.first_name,
          survey_response.last_name
        ].join(' ')
      )
    end
  end

  describe '#completed?' do
    let(:survey_response) { build(:survey_response) }

    before do
      allow(Question).to receive(:count).and_return(3)
      allow(survey_response).to receive_message_chain(:answers, :count)
        .and_return(survey_response_count)
    end

    context 'when no responses exist' do
      let(:survey_response_count) { 0 }

      it 'is false' do
        expect(survey_response.completed?).to be(false)
      end
    end

    context 'when some responses exist' do
      let(:survey_response_count) { 1 }

      it 'is false' do
        expect(survey_response.completed?).to be(false)
      end
    end

    context 'when responses exist for all questions' do
      let(:survey_response_count) { 3 }

      it 'is true' do
        expect(survey_response.completed?).to be(true)
      end
    end
  end
end
