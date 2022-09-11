class Public::ReportsController < ApplicationController

  def new
    @report = Report.new
    @work = Work.find(params[:work_id])
    @comment = Comment.find(params[:comment_id])
  end

  def create
    @report = Report.new(report_params)
    @report.save
    redirect_to works_path , notice:"コメントを報告しました。"
  end

  private
  def report_params
  params.require(:report).permit(:report,:work_id,:comment_id).merge(user_id: current_user.id)
  end


end

