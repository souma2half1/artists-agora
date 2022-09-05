class Admin::ReportsController < ApplicationController
  
  def index
    @reports = Report.all
  end
  
  def delete
  end
end
