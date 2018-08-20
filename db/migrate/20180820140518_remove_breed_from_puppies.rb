class RemoveBreedFromPuppies < ActiveRecord::Migration[5.2]
  def change
    remove_column :puppies, :breed
  end
end
