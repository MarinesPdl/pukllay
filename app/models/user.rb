class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :full_name, presence: true
  validates :role, inclusion: { in: ["owner", "player"] }
  has_many :reviews
  has_many :reservations
  has_many :fields
  has_one_attached :avatar
end
