class Inquiry < ApplicationRecord
  # アソシエーション
  belongs_to :information
  # 両方とは紐付かせることができないので、以下のアソシエーションを記述すればエラーになる
  # belongs_to :teacher
  # belongs_to :student

  validates :content, presence: true
end
