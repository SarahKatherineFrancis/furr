class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @petsitter = Petsitter.find(params[:petsitter_id])
    @booking = @petsitter.bookings.build(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path
    end
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  def my_sittings
    @bookings = Booking.where(petsitter_id: current_user.petsitter_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_name, :pet_type, :service, :petsitter_id, :user_id)
  end
end
