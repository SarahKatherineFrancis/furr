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
    @booking_ids = @bookings.ids
  end

  def my_sittings
    if current_user.petsitter
      @bookings = current_user.petsitter.bookings
    else
      @bookings = []
    end
  end

  def my_past_bookings
    @bookings = current_user.bookings
    @booking_ids = @bookings.ids
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :pet_name, :pet_type, :service, :petsitter_id, :user_id, :photo)
  end
end
