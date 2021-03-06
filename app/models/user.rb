class User < ApplicationRecord
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :birthday, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates_format_of :first_name_kana, with: /\A[ァ-ヶー－]+\z/
  validates_format_of :last_name_kana,  with: /\A[ァ-ヶー－]+\z/
end
