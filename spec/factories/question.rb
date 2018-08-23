FactoryBot.define do
  factory :question do
    title { "#{Faker::Hipster.sentence}?" }
  end
end
