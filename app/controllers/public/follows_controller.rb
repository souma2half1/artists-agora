class Public::FollowsController < ApplicationController
  
  def create
    @favorite = current_user.favorites.create(work_id: params[:work_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @work = work.find(params[:id])
    @favorite = current_user.favorites.find_by(work_id: @work_id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
