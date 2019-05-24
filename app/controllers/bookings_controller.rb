class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @bookings = Booking.new
  end

  def new
  end
end
