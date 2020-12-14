class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  # アソシエーション
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  has_many :submissions
  # carrierwaveの記述
  mount_uploader :image, ImageUploader
  # バリデーション
  with_options presence: true do
    validates :student_number
    validates :name
    validates :name_k
    validates :nickname
    validates :image
    validates :birthday
  end

end

