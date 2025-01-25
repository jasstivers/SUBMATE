class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @submarine = Submarine.find(params[:submarine_id])
    @booking = Booking.new
  end

  def create
    @submarine = Submarine.find(params[:submarine_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.submarine = @submarine
    if @booking.save
      redirect_to submarine_path(@submarine), notice: "Booking successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_datetime, :end_datetime)
  end
end
