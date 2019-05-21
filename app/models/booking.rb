class Booking < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  validates :beginning_date, presence: true
  validates :ending_date, presence: true

end
