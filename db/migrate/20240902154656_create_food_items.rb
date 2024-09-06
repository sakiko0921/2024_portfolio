class CreateFoodItems < ActiveRecord::Migration[7.2]
  def change
    create_table :food_items do |t|
      t.timestamps
      t.references :food, null: false, foreign_key: true
      t.references :shopping_list, null: false, foreign_key: true
      t.decimal :quantity, precision: 5, scale: 2
      t.integer :status, default: 0, null: false
    end
  end
end
