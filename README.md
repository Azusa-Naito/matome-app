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

# アプリ概要
複数の業務（学生との連絡、授業内容の引継ぎ、宿題の確認、学生への情報共有等）を一括で管理できるアプリケーションです。以前の職場（日本語学校）でデータ管理方法や情報共有ツールが複数あっため、業務が煩雑になってしまう場面がありました。それらをまとめ、よりスムーズに業務が行えるように開発しました。日本語学校で使用されることを想定しています。

# 使用技術・言語
- フロントエンド…HTML/CSS, javascript, BootStrap
- バックエンド…Ruby on Rails6.0
- データベース…Mysql
- AWS…EC2, S3
- 開発環境…Macos,VScode,Github

# インフラ構成


# 機能一覧
- クラスルーム作成機能（各クラスの個別ルーム作成）
- 授業記録機能
- 宿題・宿題提出機能
- チャット機能
- 情報共有機能・コメント機能


# このアプリで解決したい課題

## 学生管理
日本語業界においては留学生の管理が重要である。（出欠・進路指導）学生との連絡をアプリケーションないで行える。(メール・LINEでのやりとりが必要なし)
## データ管理が煩雑
授業に関するデータ管理が煩雑であり、アプリケーションの力で解決。(授業内容、宿題など)
紙媒体で記述していたのものをアプリケーション内に記述、誰でも閲覧可能にすることで作業効率アップ。

## 学生への情報可能
学生にすぐに情報共有ができる、かつ担任講師と連絡がとれる。



# テーブル設計


# 使い方



<!-- # テーブル設計

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
- belongs_to :student -->
