class Reservation < ApplicationRecord
  belongs_to :field
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :date_time, presence: true
end
