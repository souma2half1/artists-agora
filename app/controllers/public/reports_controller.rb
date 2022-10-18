class Public::ReportsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :public_or_guest


  def new
    @report = Report.new
    @work = Work.find(params[:work_id])
    @comment = Comment.find(params[:comment_id])
  end

  def create
    @report = Report.new(report_params)
    @report.save
    redirect_to works_path
  end

  private
  
  def report_params
    params.require(:report).permit(:body,:work_id,:comment_id).merge(user_id: current_user.id)
  end

end

