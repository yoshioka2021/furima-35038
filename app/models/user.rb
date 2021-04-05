class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :encrypted_password, format: {with:/\A[a-zA-Z0-9]+\z/ }
  validates :nick_name, presence: true
  validates :first_name, presence: true, format: {with:/^[ぁ-んァ-ン一-龥]/}
  validates :first_name_furigana, presence: true, format: {with:/^[ァ-ンヴー]+$/}
  validates :last_name, presence: true
  validates :last_name_furigana, presence: true, format: {with:/^[ァ-ンヴー]+$/}
  validates :birth_date, presence: true

end
