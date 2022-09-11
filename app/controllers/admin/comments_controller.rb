class Admin::CommentsController < ApplicationController

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to admin_reports_path
  end
end
