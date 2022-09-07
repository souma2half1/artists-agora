class Public::ReportsController < ApplicationController

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.save
    redirect_to works_path　#nitice:"コメントを報告しました。"
  end

  private
  def report_params
  params.require(:report).permit(:report)
  end


end

