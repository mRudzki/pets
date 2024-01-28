class CreatePetIntegers < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_integers do |t|
      t.integer :kind
      t.string :name
      t.float :weight
      t.date :birthday
      t.timestamps
    end
  end
end
