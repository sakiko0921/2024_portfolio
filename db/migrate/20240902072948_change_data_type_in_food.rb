class ChangeDataTypeInFood < ActiveRecord::Migration[7.2]
  def change
    change_column :foods, :protein, :decimal, precision: 5, scale: 1
    change_column :foods, :fat, :decimal, precision: 5, scale: 1
    change_column :foods, :carbohydrate, :decimal, precision: 5, scale: 1
  end
end
