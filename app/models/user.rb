class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :birthday, presence: true
         validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "is invalid" }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
         validates :katakana_last_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
         validates :katakana_first_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角カタカナで入力してください' }
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
         validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }


end
