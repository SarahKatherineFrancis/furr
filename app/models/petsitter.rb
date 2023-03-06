class Petsitter < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :experience, presence: true

  def index
    @petsitters = Petsitters.all
  end

  def show
    @petsitter = Petsitter.find(params[:id])
  end
end
