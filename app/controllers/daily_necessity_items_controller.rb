class DailyNecessityItemsController < ApplicationController
  def new
    @daily_necessity_item = DailyNecessityItem.new
    @shopping_list = current_user.shopping_lists.find(params[:shopping_list_id])
    @daily_necessity = DailyNecessity.new
    @daily_necessities = current_user.daily_necessities
  end

  def create
    puts "DEBUG: params = #{params.inspect}"
    puts params.inspect

    @shopping_list = current_user.shopping_lists.find(params[:daily_necessity_item][:shopping_list_id])
    daily_necessity_item_ids = params[:daily_necessity_item_ids]

    daily_necessity_item_ids.each do |id|
      daily_necessity_item = DailyNecessityItem.new(daily_necessity_id: id, shopping_list_id: @shopping_list.id)
      unless daily_necessity_item.save
        flash.now[:danger] = "日用品の追加に失敗しました"
        render :new and return
      end
    end
    redirect_to edit_shopping_list_path(@shopping_list), success: "日用品を追加しました"
  end

  private

  def daily_necessity_item_params
    params.require(:daily_necessity_item).permit(:name, :quantity)
  end
end
