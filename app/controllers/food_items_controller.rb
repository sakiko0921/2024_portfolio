class FoodItemsController < ApplicationController
  def new
    @food_item = FoodItem.new
    @shopping_list = current_user.shopping_lists.find(params[:shopping_list_id])
    # PFCの含有量が多い食材を重複させずに取得
    @proteins = Food.high_protein
    @fats = Food.high_fat.where.not(id: @proteins.pluck(:id))
    @carbohydrates = Food.high_carbohydrate.where.not(id: @proteins.pluck(:id) + @fats.pluck(:id))
  end

  def create
    puts "DEBUG: params = #{params.inspect}"
    puts params.inspect

    @shopping_list = current_user.shopping_lists.find(params[:food_item][:shopping_list_id])
    food_item_ids = params[:food_item_ids]

    food_item_ids.each do |id|
      food_item = FoodItem.new(food_id: id, shopping_list_id: @shopping_list.id)
      unless food_item.save
        flash.now[:danger] = "食材の追加に失敗しました"
        render :new and return
      end
    end
    redirect_to new_daily_necessity_item_path(shopping_list_id: @shopping_list.id), success: "食材を追加しました"
  end
end
