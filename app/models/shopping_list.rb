class ShoppingList < ApplicationRecord
  belongs_to :user
  has_many :food_items, dependent: :destroy
  has_many :foods, through: :food_items
  has_many :daily_necessity_items, dependent: :destroy
  has_many :daily_necessities, through: :daily_necessity_items

  validates :stocking_days, presence: true
end
