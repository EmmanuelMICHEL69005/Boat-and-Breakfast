class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :boats
  has_many :bookings
  has_many :rental_boats, through: :bookings, source: :boats
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
end
