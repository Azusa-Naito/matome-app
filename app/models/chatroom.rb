class Chatroom < ApplicationRecord
  # TeachersテーブルとStudentsテーブルとClassroomsテーブルとのアソシエーション
  belongs_to :teacher
  belongs_to :student
  belongs_to :classroom
  has_many :chats
end
