class Public::FavoritesController < ApplicationController

  def index
   #@works = current_user.favorites.works.page(params[:page])
  end

  def create
    @favorite = current_user.favorites.new(work_id: params[:work_id])
    @favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @work = Work.find(params[:work_id])
    @favorite = current_user.favorites.find_by(work_id: @work_id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
