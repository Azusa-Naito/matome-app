class Chat < ApplicationRecord
  belongs_to :chatroom
  # バリデーション
  validates :text, :judgement, presence: true
end
