class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reservation
  validates :content, presence: true
  validates :rating, numericality: true, inclusion: { in: (1..5) }
end
