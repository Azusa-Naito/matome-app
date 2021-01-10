FactoryBot.define do
  factory :homework do
    start_time { "2020-01-01" }
    content    { Faker::Lorem.sentences }
    judgement  { 3 }
    association :classroom
  end
end
