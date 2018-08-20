class Breed < ApplicationRecord
  has_many :puppies
  validates :name, presence: true, uniqueness: true
end
