class AddBreedToPuppy < ActiveRecord::Migration[5.2]
  def change
    add_reference :puppies, :breed, index: true
  end
end
