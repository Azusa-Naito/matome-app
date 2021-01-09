FactoryBot.define do
  factory :information do
    title    { Faker::Lorem.sentence }
    genre_id { Faker::Number.between(from: 2, to: 8) }
    content  { Faker::Lorem.sentences }
    association :teacher
  end
end
