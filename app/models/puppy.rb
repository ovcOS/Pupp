class Puppy < ApplicationRecord
  belongs_to :user
  belongs_to :breed
  has_many :reviews, dependent: :destroy
  validates :name, :breed, :gender, :age, :photo, presence: true
end
