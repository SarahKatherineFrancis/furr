class PetsittersController < ApplicationController
  def index
    @petsitters = Petsitter.all
  end

  def show
    @petsitter = Petsitter.find(params[:id])
    @booking = Booking.new
  end
end
