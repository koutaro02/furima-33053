class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyers

  with_options presence: true do
    validates :name
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須です' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須です' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須です' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須です' }
    validates :birthday
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)\w{6,12}\z/.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'Include both letters and numbers' }
end
