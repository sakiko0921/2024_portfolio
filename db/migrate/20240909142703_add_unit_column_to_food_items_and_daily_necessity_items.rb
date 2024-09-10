class AddUnitColumnToFoodItemsAndDailyNecessityItems < ActiveRecord::Migration[7.2]
  def change
    add_column :food_items, :unit, :integer, default: 0
    add_column :daily_necessity_items, :unit, :integer, default: 0
  end
end
