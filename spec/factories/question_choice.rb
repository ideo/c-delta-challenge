FactoryGirl.define do
  factory :question_choice do
    question
    creative_quality
    score Faker::Number.between(-5, 5)
    text Faker::Hipster.word
  end
end
