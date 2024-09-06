class ShoppingListsController < ApplicationController
  def index; end

  def show; end

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

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:stocking_days)
  end
end
