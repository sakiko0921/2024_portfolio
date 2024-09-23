class FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to new_food_path, success: "食材を登録しました。"
    else
      flash.now[:danger] = "食材の登録に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :protein, :fat, :carbohydrate)
  end
end
