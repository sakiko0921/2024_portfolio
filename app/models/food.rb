class Food < ApplicationRecord
  has_many :food_items

  validates :name, presence: true
  validates :protein, presence: true, numericality: { less_than: 1000 } # 999.9以下に制限
  validates :fat, presence: true, numericality: { less_than: 1000 } # 999.9以下に制限
  validates :carbohydrate, presence: true, numericality: { less_than: 1000 } # 999.9以下に制限

  # お気に入り機能の追加
  enum favorite: { not_favorite: 0, favorite: 1 }

  # 食材の候補表示のためのスコープ設定
  # PFCの含有量が多い食材を10個ずつ取得
  scope :high_protein, -> { order(protein: :desc).limit(10) }
  scope :high_fat, -> { order(fat: :desc).limit(10) }
  scope :high_carbohydrate, -> { order(carbohydrate: :desc).limit(10) }
end
