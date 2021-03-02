class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  japanese = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  furigana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: japanese, message: 'is invalid. Input full-width characters.' }
    validates :first_name, format: { with: japanese, message: 'is invalid. Input full-width characters.' }
    validates :last_name_kana, format: { with: furigana, message: 'is invalid. Input full-width katakana characters.' }
    validates :first_name_kana, format: { with: furigana, message: 'is invalid. Input full-width katakana characters.' }
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: 'Include both letters and numbers.' }
  end

  has_many :items
end
