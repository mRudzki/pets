class CreatePetIntegerIndices < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_integer_indices do |t|
      t.string :name
      t.float :weight
      t.date :birthday
      t.integer :kind, index: true
      t.timestamps
    end
  end
end
