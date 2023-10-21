class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :date
      t.references :pet_id, null: false, foreign_key: true
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
