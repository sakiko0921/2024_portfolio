class CreateDailyNecessities < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_necessities do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
    end
  end
end
