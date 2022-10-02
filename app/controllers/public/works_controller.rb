class Public::WorksController < ApplicationController

  before_action :authenticate_user!, except: [:index,:show]
  before_action :public_or_guest, except: [:index,:show]

  def index
    @works = Work.page(params[:page]).order(created_at: :desc)
  end

  def new
    @work = Work.new
  end

  def show
    @work = Work.find(params[:id])
    @comments = @work.comments.page(params[:page]).order(created_at: :desc)
  end

  def edit
    @user = current_user
    @work = Work.find(params[:id])
  end

  def create
    @work = Work.new(work_params)
    @work.user_id = current_user.id

    if @work.save
    redirect_to works_path
    else
    render :new
    end
  end

  def update
   @work = Work.find(params[:id])
   @work.update(work_params)
   redirect_to work_path(@work.id)
  end

  def destroy
   @work = Work.find(params[:id])
   @work.delete
   redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:image,:work,:genre,:introduction)
  end

  def public_or_guest
    if current_user.email == "guest@example.com"
      redirect_to works_path
    end
  end


end
