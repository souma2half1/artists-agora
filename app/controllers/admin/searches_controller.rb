class Admin::SearchesController < ApplicationController

 before_action :authenticate_admin!

  def index

    @range = params[:range]

    if @range == "ユーザー"
      @users = User.looks(params[:search], params[:word])
    end

    if @range =="作品"
      @works = Work.looks(params[:search], params[:word])
    end

    if @range =="ジャンル"
      @genres = Work.looks(params[:search], params[:word])
    end
  end
end
