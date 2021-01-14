FactoryBot.define do
  factory :chat do
    text      { Faker::Lorem.sentences }
    judgement { Faker::Number.between(from: 1, to: 2) }
    association :chatroom
  end
end
