class ShoppingList < ApplicationRecord
  has_many :shopping_list_items, dependent: :destroy
  belongs_to :user
end
