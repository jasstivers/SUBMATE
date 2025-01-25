class BookingsController < ApplicationController
  def index
    @bookings = Booking.includes(:user, :submarine)
  end
end
