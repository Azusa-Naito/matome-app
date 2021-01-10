FactoryBot.define do
  factory :take_over do
    start_time { "2020-01-01" }
    content    { Faker::Lorem.sentences }
    detail     { Faker::Lorem.sentences }
    appearance { Faker::Lorem.sentences }
    judgement  { 2 }
    association :classroom
    association :teacher
  end
end
