class Puppy < ApplicationRecord
  include PgSearch
  belongs_to :user
  belongs_to :breed
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :name, :breed, :gender, :age, presence: true

  pg_search_scope :global_search,
    against: [:gender, :age ],
    associated_against: {
      breed: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
