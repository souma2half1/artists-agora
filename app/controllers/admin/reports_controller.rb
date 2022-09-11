class Admin::ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def destroy
    @report = Report.find(params[:id])
    @report.delete
    redirect_to admin_reports_path
  end
end
