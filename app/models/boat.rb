class Boat < ApplicationRecord
  # belongs_to :user
  has_many :bookings
  validates :price, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  validates :category, presence: true
end
