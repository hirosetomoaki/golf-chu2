class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :state, presence: true
         validates :age, presence: true
         validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } 
         validates :name_initials, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
         


  has_many :items
  has_many :buys
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :photos
end
