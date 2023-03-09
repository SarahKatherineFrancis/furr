class Petsitter < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :experience, presence: true
end
