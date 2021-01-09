FactoryBot.define do
  factory :inquiry do
    content { Faker::Lorem.sentences }
    association :information
    association :teacher
  end
end
