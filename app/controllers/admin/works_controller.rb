class Admin::WorksController < ApplicationController

  def index
    @works = Work.page(params[:page])
  end
  
  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to works_path
  end
end
