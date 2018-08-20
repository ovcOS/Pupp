class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :price
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :status, null: false, default: "pending"
      t.references :puppy, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
