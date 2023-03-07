class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :petsitter
  has_many :bookings


  validates :email, :encrypted_password, :first_name, :last_name, :address, :phone, presence: true
  # validates ∶email_attributes, email: true
end
