class Public::RanksController < ApplicationController
  
  def index
   @favorites = Favorite.all
   @comments = Comment.all
  end
  
end
