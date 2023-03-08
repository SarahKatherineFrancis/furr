class BookingsController < ApplicationController
  before_action :authenticate_user!

  # def new
  #   @booking = Booking.new
  #   raise
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @petsitter = Petsitter.find(params[:petsitter_id])
    @booking.petsitter = @petsitter
    @booking.save
    raise
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_name, :pet_type, :service, :petsitter_id, :user_id)
  end
end
