class CreatePetStrings < ActiveRecord::Migration[6.1]
  def change
    create_table :pet_strings do |t|
      t.string :kind
      t.string :name
      t.float :weight
      t.date :birthday
      t.timestamps
    end
  end
end
