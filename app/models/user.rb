class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }
  validates :last_name_furigana, presence: true, format: { with: /\A^[ァ-ンヴー]+$+\z/ }
  
  with_options presence: true do
    validates :nickname
    validates :birth_date
    validates :first_name,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name_furigana,format: { with: /\A^[ァ-ンヴー]+$+\z/ }
    validates :last_name,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :last_name_furigana,format: { with: /\A^[ァ-ンヴー]+$+\z/ }
  end
end
