class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.text :size
      t.decimal :price
      t.text :details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
