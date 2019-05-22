class Boat < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :owner, class_name: 'User'
  has_many :bookings
  validates :price, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  validates :category, presence: true
end
# belongs_to :owner
#  => Owner
#  => owner_id
