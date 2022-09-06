class Admin::ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def delete
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to admin_reports_path
  end
end
