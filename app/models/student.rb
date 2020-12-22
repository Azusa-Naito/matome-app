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

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |student|
      student.student_number = Faker::Number.number(digits: 7)
      student.name = Faker::Name.name
      student.name_k = Gimei.name.katakana
      student.nickname = Gimei.name.last.katakana
      student.image = open('./db/fixtures/student.png')
      student.email = Faker::Internet.email
      student.password = SecureRandom.urlsafe_base64
      student.birthday = Faker::Date.between(from: '1990-01-01', to: '2002-4-01')
    end
  end
end

