class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    redirect_to petsitter_path(@review.booking.petsitter) if @review.save
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
