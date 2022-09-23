class Public::UsersController < ApplicationController


  def show
   @user = User.find(params[:id])
   @image = @user.image
   @works = @user.works.page(params[:page])
  end

  def edit
   @user = current_user
   @works = @user.works.page(params[:page])
  end

  def update
   @user = current_user
   if @user.update(user_params)
      redirect_to user_path(current_user)
   else
     render :edit
   end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end


  def unsubscribe
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:image,:name,:introduction,:email)
  end
end
