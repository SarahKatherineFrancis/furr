class BookingsController < ApplicationController
  before_action :authenticate_user!

  def my_bookings
    @bookings = current_user.bookings
  end

  def create
    @petsitter = Petsitter.find(params[:petsitter_id])
    @booking = @petsitter.bookings.build(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :service, :pet_name, :pet_type)
  end
end
