class CreateDailyNecessityItems < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_necessity_items do |t|
      t.timestamps
      t.references :daily_necessity, null: false, foreign_key: true
      t.references :shopping_list, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :quantity
    end
  end
end
