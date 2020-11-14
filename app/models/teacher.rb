class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  
  with_options presence: true do
    validates :employee_number
    validates :status_id, numericality: { other_than: 1 }
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :last_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :last_name_k
      validates :first_name_k
    end
    validates :image
    validates :nickname
  end


end
