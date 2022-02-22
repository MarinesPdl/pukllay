class Reservation < ApplicationRecord
  belongs_to :field
  belongs_to :user
  has_many :reviews
  validates :date_time, presence: true
end
