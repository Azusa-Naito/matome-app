FactoryBot.define do
  factory :teacher do
    employee_number       { Faker::Number.number(digits: 6) }
    status_id             { Faker::Number.between(from: 2, to: 4) }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    last_name_k           { Gimei.last.katakana }
    first_name_k          { Gimei.first.katakana }
    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/test.png')) }    
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    nickname              { Gimei.last.hiragana }
  end
end
