class DailyNecessitiesController < ApplicationController
  def create
    puts "DEBUG: params = #{params.inspect}"
    puts params.inspect

    @daily_necessity = current_user.daily_necessities.build(daily_necessity_params)
    if @daily_necessity.save
      redirect_to new_daily_necessity_item_path(shopping_list_id: params[:shopping_list_id], daily_necessity_id: @daily_necessity.id)
    else
      render :new
    end
  end

  private

  def daily_necessity_params
    params.require(:daily_necessity).permit(:name)
  end
end
