class Inquiry < ApplicationRecord
  # アソシエーション
  belongs_to :information
  belongs_to :teacher, optional: true
  belongs_to :student, optional: true

  validates :content, presence: true
end
