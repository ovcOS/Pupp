class ChangeDatetimeToTimeForBookings < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :starts_at, :time
    change_column :bookings, :ends_at, :time
  end
end
