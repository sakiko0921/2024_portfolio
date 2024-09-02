class Food < ApplicationRecor
  # has_many :food_items

  validates :name, presence: true
  validates :protein, presence: true, numericality: { less_than: 1000 } # 999.9以下に制限
  validates :fat, presence: true, numericality: { less_than: 1000 } # 999.9以下に制限
  validates :carbohydrate, presence: true, numericality: { less_than: 1000 } # 999.9以下に制限

  # お気に入り機能の追加
  enum favorite: { not_favorite: 0, favorite: 1 }

end
