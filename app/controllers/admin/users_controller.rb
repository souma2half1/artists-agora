class Admin::UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to admin_admin_path, notice: 'ユーザー情報を更新しました'
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_admin_path
  end

  def user_params
    params.require(:user).permit(:image,:name,:introduction,:email)
  end
end
