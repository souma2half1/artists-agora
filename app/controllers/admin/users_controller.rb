class Admin::UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @works = @user.works.page(params[:page]).order(created_at: :desc)
  end

  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to admin_user_path(@user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_admin_path
  end

  def unsubscribe
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:image,:name,:introduction,:email)
  end
end
