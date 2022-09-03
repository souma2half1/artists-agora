class Public::WorksController < ApplicationController

  def index
    @works = Work.page(params[:page])
    #@comments = @work.comments.all
  end

  def new
    @work = Work.new
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
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
end
