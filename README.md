# ClassMatome
アプリケーションURL:http://classmatome.com/

![classmatome com_ (1)](https://user-images.githubusercontent.com/69580714/105803010-d15fe300-5fdf-11eb-8300-42eb38403b8d.png)

# アプリ概要
複数の業務（学生との連絡、授業内容の引継ぎ、宿題の確認、学生への情報共有等）を一括で管理できるアプリケーションです。以前の職場（日本語学校）でデータ管理方法や情報共有ツールが複数あっため、業務が煩雑になってしまう場面がありました。それらをまとめ、よりスムーズに業務が行えるように開発しました。日本語学校で使用されることを想定しています。

# 使用技術・言語
- フロントエンド…HTML/CSS, javascript, BootStrap
- バックエンド…Ruby on Rails6.0
- データベース…Mysql
- AWS…EC2, S3
- 開発環境…Macos,VScode,Github

# 機能一覧
- クラスルーム作成機能（各クラスの個別ルーム作成）
- 授業記録機能
- 宿題・宿題提出機能
- チャット機能
- 情報共有機能・コメント機能

#### 学生管理
日本語業界においては留学生の管理が重要である。（出欠・進路指導）学生との連絡をアプリケーションないで行える。(メール・LINEでのやりとりが必要なし)
#### データ管理が煩雑
授業に関するデータ管理が煩雑であり、アプリケーションの力で解決。(授業内容、宿題など)
紙媒体で記述していたのものをアプリケーション内に記述、誰でも閲覧可能にすることで作業効率アップ。

#### 学生への情報可能
学生にすぐに情報共有ができる、かつ担任講師と連絡がとれる。

# テーブル設計
<img alt="スクリーンショット 2021-01-26 20 43 41" src="https://user-images.githubusercontent.com/69580714/105841045-59adaa80-6017-11eb-883f-99fb28d68a9e.png">

# 使い方
| 機能                                                                                                     | 画面                                                                                                                         |
|----------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
|このアプリケーションは講師と学生とで使える機能が異なります。講師として、または学生としてログインできます。|![classmatome com_ (1)](https://user-images.githubusercontent.com/69580714/105803010-d15fe300-5fdf-11eb-8300-42eb38403b8d.png)|

### クラスルーム作成
| 機能                                                                                                   | 画面                                                                                                                                                         |
|--------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
|クラスルームを作成します。クラスの作成は講師のみ行えます。同じクラスで授業をする講師、学生を追加します。|<img alt="スクリーンショット 2021-01-26 15 01 33" src="https://user-images.githubusercontent.com/69580714/105842250-413e8f80-6019-11eb-82b2-c03135e8fa02.png">|

### クラスルーム
| 機能                                                                                                                                                             | 画面                                                                                                                                                         |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
|作成したクラスルームの中に入ると授業記録を書いたり（講師のみ閲覧可）、宿題を出したり（講師・学生ともに閲覧可）できます。また、各先生が作成した情報も閲覧可能です。|<img alt="スクリーンショット 2021-01-26 17 35 18" src="https://user-images.githubusercontent.com/69580714/105823089-1431b300-6000-11eb-8945-dc1d4928d2b0.png">|

### チャット
| 機能                                 | 画面                                                                                                                                                          |
|--------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
|クラスの学生と個別チャットができます。｜<img alt="スクリーンショット 2021-01-26 20 57 28" src="https://user-images.githubusercontent.com/69580714/105842277-47cd0700-6019-11eb-9f5a-1c31dd303023.png">｜


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
