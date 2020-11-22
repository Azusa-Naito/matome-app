class Information < ApplicationRecord
  # アソシエーション
  belongs_to :teacher
  # ActiveHashのメソッド
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
end
