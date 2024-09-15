class FoodCalculator
  def initialize(food_items, member_infos)
    @food_items = food_items
    @member_infos = member_infos
  end

  def calculate
    total_protein = 0
    total_fat = 0
    total_carbohydrate = 0
    required_protein = 0
    required_fat = 0
    required_carbohydrate = 0

    @food_items.each do |food_item|
      food = food_item.food
      total_protein += food.protein * food_item.quantity / 100
      total_fat += food.fat * food_item.quantity / 100
      total_carbohydrate += food.carbohydrate * food_item.quantity / 100
    end

    @member_infos.each do |member_info|
      weight = member_info.weight
      required_protein += weight * 1
      required_fat += weight * 1
      required_carbohydrate += weight * 4
    end
    { protein: required_protein - total_protein, fat: required_fat - total_fat, carbohydrate: required_carbohydrate - total_carbohydrate,
      total_protein: total_protein, total_fat: total_fat, total_carbohydrate: total_carbohydrate }
  end
end
