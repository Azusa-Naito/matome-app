# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 実行コマンド
# rails db:seed

require 'faker'

# teacherのデータ作成
20.times do
  gimei = Gimei.name
  employee_number = Faker::Number.number(digits: 6)
  status_id = Faker::Number.between(from: 2, to: 4)
  last_name = gimei.last.kanji
  first_name = gimei.first.kanji
  last_name_k = gimei.last.katakana
  first_name_k = gimei.first.katakana
  image = open('./db/fixtures/teacher.png')
  email = Faker::Internet.email
  password = '1a1a1a1a'
  nickname = gimei.last.hiragana
  Teacher.create!(
    employee_number:    employee_number, 
    status_id:          status_id, 
    last_name:          last_name,
    first_name:         first_name,
    last_name_k:        last_name_k,
    first_name_k:       first_name_k,
    image:              image,
    email:              email,
    password:           password,
    encrypted_password: password,
    nickname:           nickname,
    created_at:         "2020-11-01 00:00:00",
    updated_at:         "2020-11-01 00:00:00"
  )
end

# studentのデータ作成
100.times do
  gimei = Gimei.name
  student_number = Faker::Number.number(digits: 7)
  name = Faker::Name.name
  name_k = gimei.katakana
  nickname = gimei.last.katakana
  image = open('./db/fixtures/student.png')
  email = Faker::Internet.email
  password = '1a1a1a1a'
  birthday = Faker::Date.between(from: '1990-01-01', to: '2002-4-01')
  Student.create!(
    student_number:     student_number,  
    name:               name,
    name_k:             name_k,
    nickname:           nickname,
    image:              image,
    email:              email,
    password:           password,
    encrypted_password: password,
    birthday:           birthday,
    created_at:         "2020-11-01 00:00:00",
    updated_at:         "2020-11-01 00:00:00"
  )
end

# classroomのデータ作成

# informationのデータ作成
