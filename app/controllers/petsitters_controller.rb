class PetsittersController < ApplicationController
  def index
    @petsitters = Petsitter.all
    @markers = @petsitters.geocoded.map do |petsitter|
      {
        lat: petsitter.latitude,
        lng: petsitter.longitude
      }
    end
  end

  def show
    @petsitter = Petsitter.find(params[:id])
    @booking = Booking.new
    @reviews = Review.all
    @count = sitter_reviews_counter
    @average = average_review_score
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
    @reviews = Review.all
    count = 0
    @reviews.each do |review|
      if review.booking.petsitter.id == @petsitter.id
        count += 1
      end
    end
    return count
  end

  def average_review_score
    @reviews = Review.all
    scores = []
    @reviews.each do |review|
      scores << review.rating if review.booking.petsitter.id == @petsitter.id
    end
    sum = 0
      scores.each do |rating|
        sum += rating
      end
    average = sum / scores.count
    return average
  end

  private

  def petsitter_params
    params.require(:petsitter).permit(:experience, :availability)
  end

end
