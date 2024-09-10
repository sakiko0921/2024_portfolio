class FoodItem < ApplicationRecord
  belongs_to :food
  belongs_to :shopping_list

  enum unit: { g: 0, ml: 1, 個: 2 }
end
