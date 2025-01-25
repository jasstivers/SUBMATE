class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = Booking.includes(:user, :submarine)
  end

  def new
    @submarine = Submarine.find(params[:submarine_id])
    @booking = Booking.new
  end

  def create
    @submarine = Submarine.find(params[:submarine_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.submarine = @submarine
    @booking.status = 'pending' # Set the booking status to pending

    if @booking.save
      redirect_to submarine_path(@submarine), notice: "Booking is pending approval from the owner!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_datetime, :end_date)
  end
end
