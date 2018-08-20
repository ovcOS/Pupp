class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :owned_puppies, class_name: 'Puppy', foreign_key: :user_id
  has_many :booked_bookings, class_name:'Booking'
  has_many :posted_bookings, through: :owned_puppies, source: :bookings
  has_many :booked_puppies, through: :booked_bookings, source: :puppy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
end
