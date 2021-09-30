class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages

  validates :name, presence: true
  validates :concept, presence: true
  validates :score, presence: true
  validates :about_age, presence: true
  validates :member, presence: true
  
end
