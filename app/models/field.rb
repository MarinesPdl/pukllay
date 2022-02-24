class Field < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many_attached :photos
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: true
end
