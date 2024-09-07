class RemoveColumnStatusFromFoodItem < ActiveRecord::Migration[7.2]
  def change
    remove_column :food_items, :status, :integer
  end
end
