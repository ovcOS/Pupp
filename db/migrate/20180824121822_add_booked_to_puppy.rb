class AddBookedToPuppy < ActiveRecord::Migration[5.2]
  def change
    add_column :puppies, :booked, :boolean, default: false
  end
end
