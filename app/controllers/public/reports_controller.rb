class Public::ReportsController < ApplicationController

  def new
  end

  def create
    @report = Report.new(report_params)
    @report.save
    redirect_to comments_path
  end

  private
  def report_params
  params.require(:report).permit(:report)
  end


end

