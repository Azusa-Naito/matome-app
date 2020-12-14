class TakeOver < ApplicationRecord
  # アソシエーション
  belongs_to :classroom
  belongs_to :teacher
  # バリデーション
  validates :start_time, :content, :detail, :appearance, :judgement, :classroom_id, :teacher_id, presence: true
end
