class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :petsitter
  has_many :bookings

  has_one_attached :photo

  validates :email, :encrypted_password, :first_name, :last_name, :address, :phone, presence: true
end
