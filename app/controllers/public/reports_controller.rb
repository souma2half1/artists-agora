class Public::ReportsController < ApplicationController

  def new
  end

  def create
    @report = Report.new(report_params)
    @report.save
    redirect_to works_path
  end

  private
  def report_params
  params.permit(:report)
  end


end

