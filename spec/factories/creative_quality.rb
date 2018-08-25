FactoryBot.define do
  factory :creative_quality do
    name { Faker::Company.buzzword }
    description { Faker::Company.bs.titleize }
    color { Faker::Color.hex_color }
  end
end
