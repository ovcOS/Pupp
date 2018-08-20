class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :owned_puppies, class_name: "Puppy"
  has_many :bookings
  has_many :booked_puppies, through: :bookings, source: :puppy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
end
