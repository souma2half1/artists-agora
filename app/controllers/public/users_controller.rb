class Public::UsersController < ApplicationController

  def show
   @user = current_user
   @image = @user.image
   @works = current_user.works.page(params[:page])
  end

  def edit
   @user = current_user
  end

  def update
   @user = current_user
   if @user.update(user_params)
      redirect_to user_path(current_user), notice: 'ユーザー情報を更新しました'
   else
     render :edit
   end
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to root_path
  end


  def unsubscribe
  end

  private

  def user_params
    params.require(:user).permit(:image,:name,:introduction,:email)
  end
end
