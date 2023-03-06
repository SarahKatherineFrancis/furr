class CreatePetsitters < ActiveRecord::Migration[7.0]
  def change
    create_table :petsitters do |t|
      t.text :experience
      t.boolean :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
