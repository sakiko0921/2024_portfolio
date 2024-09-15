class FoodCalculator
  def initialize(food_items)
    @food_items = food_items
  end

  def calculate
    total_protein = 0
    total_fat = 0
    total_carbohydrate = 0

    @food_items.each do |food_item|
      food = food_item.food
      total_protein += food.protein * 1
      total_fat += food.fat * 1
      total_carbohydrate += food.carbohydrate * 3
    end

    { protein: total_protein, fat: total_fat, carbohydrate: total_carbohydrate }
  end
end
