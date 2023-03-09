class RemoveColumnsFromPetsitter < ActiveRecord::Migration[7.0]
  def change
    remove_column :petsitters, :address
    remove_column :petsitters, :latitude
    remove_column :petsitters, :longitude
  end
end
