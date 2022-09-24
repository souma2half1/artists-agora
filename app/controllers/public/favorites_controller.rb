class Public::FavoritesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  before_action :public_or_guest, except: [:index]


  def index
   @user = User.find(params[:id])
   @works = @user.favorites.page(params[:page])
  end

  def create
    @favorite = current_user.favorites.new(work_id: params[:work_id])
    @favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @work = Work.find(params[:work_id])
    @favorite = current_user.favorites.find_by(work_id: @work.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def public_or_guest
    if current_user.email == "guest@example.com"
      redirect_to works_path
    end
  end
  
end
