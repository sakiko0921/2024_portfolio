class ChangeQuantityDefaultInFoodItemsAndDailyNecessityItems < ActiveRecord::Migration[7.2]
  def change
    change_column_default :food_items, :quantity, from: nil, to: 0
    change_column_default :daily_necessity_items, :quantity, from: nil, to: 0
  end
end
