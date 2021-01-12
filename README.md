# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## teachers テーブル
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| employee_number | integer | null: false |
| status_id       | integer | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_k     | string  | null: false |
| first_name_k    | string  | null: false |
| image           | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| nickname        | string  | null: false |
### Association
- has_many :classroom_teachers
- has_many :classrooms, through: :classroom_teachers
- has_many :informations
- has_many :inquiries
- has_many :chatrooms
- has_many :take_overs
- has_many :homeworks


## students テーブル
| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| student_number | integer | null: false |
| name           | string  | null: false |
| name_k         | string  | null: false |
| nickname       | string  | null: false |
| image          | string  | null: false |
| email          | string  | null: false |
| password       | string  | null: false |
| birthday       | date    | null: false |
### Association
- has_many :classroom_students
- has_many :classrooms, through: :classroom_students
- has_many :inquiries
- has_many :chatrooms
- has_many :submissions

## informations テーブル
| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| title    | string  | null: false |
| genre_id | integer | null: false |
| content  | text    | null: false |
### Association
- belongs_to :teacher
- has_many :inquiries

## inquiries テーブル
| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| content  | text    | null: false |
### Association
- belongs_to :information
- belongs_to :teacher, optional: true
- belongs_to :student, optional: true

## classrooms テーブル
| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| year_month | date   | null: false |
### Association
- has_many :classroom_teachers, dependent: :destroy
- has_many :classroom_students, dependent: :destroy
- has_many :teachers, through: :classroom_teachers
- has_many :students, through: :classroom_students
- has_many :chatrooms
- has_many :take_overs
- has_many :homeworks

## chatrooms テーブル
### Association
- belongs_to :teacher
- belongs_to :student
- belongs_to :classroom
- has_many :chats

## chats テーブル
| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| text      | text    | null: false |
| judgement | integer | null: false |
### Association
- belongs_to :chatroom

## take_overs テーブル
| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| start_time | datetime | null: false |
| content    | text     | null: false |
| detail     | text     | null: false |
| appearance | text     | null: false |
| judgement  | integer  | null: false |
### Association
- belongs_to :classroom
- belongs_to :teacher

## homeworks テーブル
| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| start_time | datetime | null: false |
| content    | text     | null: false |
| judgement  | integer  | null: false |
### Association
- belongs_to :classroom
- belongs_to :teacher
- has_many :submissions
- has_one_attached :file

## submissions テーブル
| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| start_time | datetime | null: false |
| content    | text     | null: false |
| judgement  | integer  | null: false |
### Association
- belongs_to :homework
- belongs_to :student
