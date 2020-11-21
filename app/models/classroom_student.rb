class ClassroomStudent < ApplicationRecord
  belongs_to :student
  belongs_to :classroom
  # クラスルーム作成時のバリデーション
  validates :student_id, presence: true
end
