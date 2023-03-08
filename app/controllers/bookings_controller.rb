class BookingsController < ApplicationController
  before_action :authenticate_user!

  def my_bookings
    @bookings = current_user.bookings
  end
end
