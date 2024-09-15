class Food < ApplicationRecord
  has_many :food_items
  has_many :shopping_lists, through: :food_items

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

  class FoodCalculator
    def initialize(shopping_list_id)
      @shopping_list_id = shopping_list_id
    end

    def calculate
      food_items = FoodItem.where(shopping_list_id: @shopping_list_id)

      food_items.each do |food_item|
        food = food_item.food
        protein = food.protein * 1
        fat = food.fat * 1
        carbohydrate = food.carbohydrate * 3

        # ここで計算結果を使用します。例えば、結果を表示する場合：
        puts "Protein: #{protein}, Fat: #{fat}, Carbohydrate: #{carbohydrate}"
      end
    end
  end
end
