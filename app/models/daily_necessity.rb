class DailyNecessity < ApplicationRecord
  belongs_to :user
  has_many :daily_necessity_items, dependent: :destroy
  has_many :shopping_lists, through: :daily_necessity_items
end
