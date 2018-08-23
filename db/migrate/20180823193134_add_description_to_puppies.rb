class AddDescriptionToPuppies < ActiveRecord::Migration[5.2]
  def change
    add_column :puppies, :description, :text
  end
end
