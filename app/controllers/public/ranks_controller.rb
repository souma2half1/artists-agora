class Public::RanksController < ApplicationController

  def index
   @favorites_works = Work.find(Favorite.group(:work_id).order('count(user_id) desc').pluck(:work_id))
   @comments_works = Work.find(Comment.group(:work_id).order('count(user_id) desc').pluck(:work_id))
  end

end
