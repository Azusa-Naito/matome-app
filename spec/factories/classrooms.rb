FactoryBot.define do
  factory :classroom do
    name       { "進学A" }
    year_month { "2020-01-01" }
    association :teacher
  end
end
