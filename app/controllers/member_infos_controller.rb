class MemberInfosController < ApplicationController
  def new
    @member_info = MemberInfo.new
    @member_infos = current_user.member_infos.includes(:user).order(created_at: :desc)
    @shopping_list = current_user.shopping_lists.new
  end

  def create
    @member_info = current_user.member_infos.build(member_info_params)
    if @member_info.save
      redirect_to new_member_info_path, success: "会員登録が完了しました"
    else
      @member_infos = current_user.member_infos.includes(:user).order(created_at: :desc)
      flash.now[:danger] = "会員登録に失敗しました"
      render :new
    end
  end

  def destroy
    @member_info = current_user.member_infos.find(params[:id])
    @member_info.destroy!
    redirect_to new_member_info_path, success: "会員情報を削除しました", status: :see_other
  end

  private

  def member_info_params
    params.require(:member_info).permit(:name, :age, :height, :weight, :gender).tap do |whitelisted|
      whitelisted[:gender] = whitelisted[:gender].to_i
    end
  end
end
