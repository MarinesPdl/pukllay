class User < ApplicationRecord
  validates :full_name, presence:true
  validates :role, inclusion: { in: ["owner", "player"] }
  validates :user_phone_number, presence: true, numericality: true
  has_many :reviews
  has_many :reservations
  has_many :fields
end
