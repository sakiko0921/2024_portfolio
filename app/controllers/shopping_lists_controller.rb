class ShoppingListsController < ApplicationController
  def index
    @shopping_lists = current_user.shopping_lists.order(created_at: :desc).limit(6)
  end

  def show
    @shopping_list = current_user.shopping_lists.find(params[:id])
    @foods = @shopping_list.foods
    @food_items = @shopping_list.food_items
    @daily_necessities = @shopping_list.daily_necessities
    @daily_necessity_items = @shopping_list.daily_necessity_items
  end

  def new
    @shopping_list = current_user.shopping_lists.new
  end

  def create
    @shopping_list = current_user.shopping_lists.build(shopping_list_params)
    if @shopping_list.save
      # 次のページにshopping_list_idを渡す
      redirect_to new_food_item_path(shopping_list_id: @shopping_list.id), success: "買い物リストを作成しました"
    else
      flash.now[:danger] = "買い物リストの作成に失敗しました"
      render :new
    end
  end

  def edit
    @shopping_list = current_user.shopping_lists.find(params[:id])
    @food_items = @shopping_list.food_items
    @foods = @shopping_list.foods
    @daily_necessity_items = @shopping_list.daily_necessity_items
    @daily_necessities = @shopping_list.daily_necessities

    @member_infos = current_user.member_infos
    calculator = FoodCalculator.new(@food_items, @member_infos)
    @nutrient_amounts = calculator.calculate
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:stocking_days)
  end
end
