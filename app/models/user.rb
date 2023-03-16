class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates_format_of :password, with: PASSWORD_REGEX
   validates :nickname, presence: true
   validates :first_name, presence: true
   validates :family_name, presence: true
   validates :first_name_kana, presence: true
   validates :family_name_kana, presence: true
   validates :birth_date, presence: true

   has_many :items
   has_many :orders

   validates :nickname, presence: true
end
