class Field < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: true
end
