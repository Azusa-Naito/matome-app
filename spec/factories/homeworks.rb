FactoryBot.define do
  factory :homework do
    start_time { "2020-01-01" }
    content    { Faker::Lorem.sentences }
    judgement  { Faker::Number.between(from: 1, to: 2) }
    association :classroom
  end
end
