FactoryBot.define do
  factory :submission do
    content { Faker::Lorem.sentences }
    association :student
    association :homework
  end
end
