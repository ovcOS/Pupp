class Booking < ApplicationRecord
  PENDING = 'pending'
  ACCEPTED = 'accepted'
  COMPLETED = 'completed'
  CANCELED = 'canceled'
  REJECTED = 'rejected'

  belongs_to :puppy
  belongs_to :booker, class_name: "User", foreign_key: :user_id
  validates :price, :starts_at, :ends_at, presence: true
  validates :price, numericality: { only_integer: true }
  validates :status, inclusion: { in: [PENDING, ACCEPTED, COMPLETED, CANCELED, REJECTED] }
end

