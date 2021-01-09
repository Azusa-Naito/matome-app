FactoryBot.define do
  factory :student do
    student_number        { Faker::Number.number(digits: 7) }
    name                  { Faker::Name.name }
    name_k                { Gimei.katakana }
    nickname              { Gimei.last.katakana }
    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/test.png')) }    
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    birthday              { Faker::Date.between(from: '1990-01-01', to: '2002-4-01') }
  end
end
