class Homework < ApplicationRecord
  # アソシエーション
  belongs_to :classroom
  belongs_to :teacher
  # ActiveStorage
  has_one_attached :file

  # バリデーション
  validates :content, :start_time, :judgement, :classroom_id, :teacher_id, presence: true
end
