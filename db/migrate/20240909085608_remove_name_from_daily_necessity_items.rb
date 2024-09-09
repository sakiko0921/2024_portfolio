class RemoveNameFromDailyNecessityItems < ActiveRecord::Migration[7.2]
  def change
    remove_column :daily_necessity_items, :name, :string
  end
end
