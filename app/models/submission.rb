class Submission < ApplicationRecord
  # アソシエーション
  belongs_to :homework
  belongs_to :student
  # ActiveStorage
  has_one_attached :file

  # バリデーション
  validates :content, :homework_id, :student_id, presence: true
end
