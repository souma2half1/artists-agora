class Admin::WorksController < ApplicationController

  def index
    @works = Work.page(params[:page])
  end

  def show
    @work = Work.find(params[:id])
    @comments = @work.comments.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
    @work = Work.find(params[:id])
  end

  def destroy
    @work = Work.find(params[:id])
    @work.delete
    redirect_to works_path
  end

  def update
     @work = Work.find(params[:id])
     @work.update(work_params)
     redirect_to admin_work_path(@work.id)
  end

  def work_params
    params.require(:work).permit(:image,:work,:genre,:introduction)
  end

end
