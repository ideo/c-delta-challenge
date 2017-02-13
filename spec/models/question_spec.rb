require 'rails_helper'

describe Question do
  context 'associations' do
    it { is_expected.to have_many(:choices) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :choices }
  end
end
