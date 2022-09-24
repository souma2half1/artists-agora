class Admin::CommentsController < ApplicationController
  
  before_action :authenticate_admin!

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to admin_reports_path
  end
end
