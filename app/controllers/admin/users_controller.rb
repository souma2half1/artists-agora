class Admin::UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to admmin_admin_path(current_user), notice: 'ユーザー情報を更新しました'
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to admin_admin_path
  end
end
