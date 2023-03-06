class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :petsitter

  validates :start_date, :end_date, :service, :pet_name, :pet_type, presence: true
end
