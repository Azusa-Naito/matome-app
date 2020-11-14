class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :student_number
    validates :name, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
    validates :last_name_k, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :nickname
    validates :image
    validates :birthday
  end
end
