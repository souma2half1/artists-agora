class Admin::ReportsController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @reports = Report.all
  end

  def destroy
    @report = Report.find(params[:id])
    @report.delete
    redirect_to admin_reports_path
  end
end
