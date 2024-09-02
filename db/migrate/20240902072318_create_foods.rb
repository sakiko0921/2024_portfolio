class CreateFoods < ActiveRecord::Migration[7.2]
  def change
    create_table :foods do |t|
      t.timestamps
      t.string :name, null: false
      t.decimal :protein, null: false
      t.decimal :fat, null: false
      t.decimal :carbohydrate, null: false
      t.integer :favorite, default: 0
    end
  end
end
