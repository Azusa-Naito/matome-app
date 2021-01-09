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
    validates :name_k, format: {with: /\A[ァ-ヶー－ 　]+\z/, message: 'は全角カタカナのみで入力してください'}
    validates :nickname
    validates :image
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/i, message: 'は半角英数字6文字以上で入力してください'}
    validates :birthday
  end

  # 期間の重複がないかどうか
  # classroom_studentsを作成する際に、classroom_studentsの中にあるその学生のidと紐づいているクラスが同じ期間のものだったらエラー文吐き出し
  # if 

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |student|
      student.student_number = Faker::Number.number(digits: 7)
      student.name = Faker::Name.name
      student.name_k = Gimei.name.katakana
      student.nickname = Gimei.name.last.katakana
      student.image = open('./db/fixtures/student.png')
      student.password = SecureRandom.urlsafe_base64
      student.birthday = Faker::Date.between(from: '1990-01-01', to: '2002-4-01')
    end
  end
end

