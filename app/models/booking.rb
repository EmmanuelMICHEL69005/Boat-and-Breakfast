class Booking < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  validates :beginning_date, presence: true
  validates :ending_date, presence: true

  def price
    (ending_date - beginning_date).to_i * boat.price
  end

  def user
   # => @user = User.find(params[:id])
  end

end
