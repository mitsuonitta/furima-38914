class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
   with_options presence: true do
   validates :nickname, presence: true
   validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
   validates :first_name_kana, :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
   validates :birth_date, presence: true
 end
end
#validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze}
#validates :nickname, presence: true
#validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
#validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]+\z/}
#validates :last_name_kana, presence: true, format:  { with: /\A[ァ-ヶー－]+\z/}
#validates :first_name_kana, presence: true, format:  { with: /\A[ァ-ヶー－]+\z/}
#validates :birthday, presence: true
#end