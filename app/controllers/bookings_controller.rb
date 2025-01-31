class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:confirm, :reject]

  def index
    @bookings = Booking.includes(:user, :submarine).where(submarine: { user: current_user })
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.update(status: 'confirmed')
    redirect_to bookings_path, notice: 'Booking confirmed.'
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update(status: 'rejected')
    redirect_to bookings_path, notice: 'Booking rejected.'
  end

  def new
    @submarine = Submarine.find(params[:submarine_id])
    @booking = Booking.new(start_datetime: params[:start_date], end_date: params[:end_date])
  end

  def create
    @submarine = Submarine.find(params[:submarine_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.submarine = @submarine
    @booking.status = 'pending'

    if @booking.save
      redirect_to bookings_path, notice: "Booking is pending approval from the owner!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_datetime, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
