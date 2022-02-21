class Reservation < ApplicationRecord
  belongs_to :field
  belongs_to :user
  has_many :reviews
  validates :date, presence: true
  validates :time, presence: true
end
