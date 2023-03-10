class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :petsitter
  has_many :bookings

  validates :email, :encrypted_password, :first_name, :last_name, :address, :phone, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :petsitters, -> { joins(:petsitter) }
end
