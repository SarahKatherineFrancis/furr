class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :petsitter

  has_many :reviews
  has_one_attached :photo

  validates :start_date, :end_date, :service, :pet_name, :pet_type, presence: true
end
