class Chat < ApplicationRecord
  # アソシエーション
  belongs_to :classroom
  # バリデーション
  validates :text, presence: true
end
