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
  with_options presence: true do
    validates :name
    # validates :teacher_ids
    # validates :student_ids
  end
end
