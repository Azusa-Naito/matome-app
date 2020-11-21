class ClassroomTeacher < ApplicationRecord
  belongs_to :teacher
  belongs_to :classroom
  # クラスルーム作成時のバリデーション
  validates :teacher_id, presence: true
end
