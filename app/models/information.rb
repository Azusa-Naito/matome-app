class Information < ApplicationRecord
  # アソシエーション
  belongs_to :teacher
  # ActiveHashのメソッド
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  # バリデーション
  with_options presence: true do
    validates :title
    validates :genre_id, numericality: { other_than: 1 }
    validates :content
  end
end
