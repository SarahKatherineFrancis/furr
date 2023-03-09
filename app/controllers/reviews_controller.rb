class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id = params[:booking_id]
    redirect_to root_path if @review.save
    raise
  end

  private

  def review_params
    params.require(:review).permit(:comment, :raiting)
  end
end
