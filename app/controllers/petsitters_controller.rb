class PetsittersController < ApplicationController
  def index
    @petsitters = Petsitter.all
  end

  def show
    @petsitter = Petsitter.find(params[:id])
    @booking = Booking.new
    @reviews = Review.all
    @sitter_reviews = sitter_reviews_counter
    end

  def new
    @petsitter = Petsitter.new
  end

  def create
    @petsitter = Petsitter.new(petsitter_params)
    @petsitter.user_id = current_user.id
    redirect_to root_path if @petsitter.save
  end

  def sitter_reviews_counter
    sitter_reviews = []
    @reviews = Review.all
    @reviews.each do |review|
      if review.booking.petsitter.id == @petsitter.id
        sitter_reviews << review
      end
    return sitter_reviews.count
    end
  end

  private

  def petsitter_params
    params.require(:petsitter).permit(:experience, :availability)
  end
end
