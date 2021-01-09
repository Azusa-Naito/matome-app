class Classroom < ApplicationRecord
  # 中間テーブルとのアソシエーション(throughより上に書かないといけない)
  has_many :classroom_teachers, dependent: :destroy
  has_many :classroom_students, dependent: :destroy
  # アソシエーション
  has_many :teachers, through: :classroom_teachers
  has_many :students, through: :classroom_students
  has_many :chatrooms
  has_many :take_overs
  has_many :homeworks
  # 同時に中間テーブルのレコードも更新
  accepts_nested_attributes_for :classroom_teachers, allow_destroy: true
  accepts_nested_attributes_for :classroom_students, allow_destroy: true
  
  # バリデーション
  validates :name, :year_month, :teacher_id, presence: true
end
