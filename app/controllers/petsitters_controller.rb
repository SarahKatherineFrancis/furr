class PetsittersController < ApplicationController
  def index
    @petsitters = Petsitter.all
  end

  def show
    @petsitter = Petsitter.find(params[:id])
    @booking = Booking.new
  end

  def new
    @petsitter = Petsitter.new
  end

  def create
    @petsitter = Petsitter.new(petsitter_params)
    @petsitter.user_id = current_user.id
    redirect_to root_path if @petsitter.save
  end

  private

  def petsitter_params
    params.require(:petsitter).permit(:experience, :availability)
  end
end
