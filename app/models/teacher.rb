class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  # アソシエーション
  has_many :classroom_teachers
  has_many :classrooms, through: :classroom_teachers
  has_many :informations
  has_many :take_overs
  has_many :homeworks
  # ActiveHashのメソッド
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  # carrierwaveの記述
  mount_uploader :image, ImageUploader
  # バリデーション
  with_options presence: true do
    validates :employee_number
    validates :status_id, numericality: { other_than: 1 }
    # with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字を使用してください'} do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナのみで入力してください'} do
      validates :last_name_k
      validates :first_name_k
    end
    validates :image
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/i, message: 'は半角英数字6文字以上で入力してください'}
    validates :nickname
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |teacher|
      # teacher.password = SecureRandom.urlsafe_base64
      gimei = Gimei.name
      teacher.employee_number = Faker::Number.number(digits: 6)
      teacher.status_id = Faker::Number.between(from: 2, to: 4)
      teacher.last_name = gimei.last.kanji
      teacher.first_name = gimei.first.kanji
      teacher.last_name_k = gimei.last.katakana
      teacher.first_name_k = gimei.first.katakana
      teacher.image = open('./db/fixtures/teacher.png')
      teacher.password = '1a1a1a1a'
      teacher.nickname = gimei.last.hiragana
    end
  end
end
