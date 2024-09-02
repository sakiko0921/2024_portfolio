class AddColumnToShoppingLists < ActiveRecord::Migration[7.2]
  def change
    add_column :shopping_lists, :stocking_days, :integer, null: false, default: 1
    add_reference :shopping_lists, :user, null: false, foreign_key: true
  end
end
