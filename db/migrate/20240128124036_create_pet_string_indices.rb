class CreatePetStringIndices < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_string_indices do |t|
      t.string :name
      t.float :weight
      t.date :birthday
      t.string :kind, index: true
      t.timestamps
    end
  end
end
