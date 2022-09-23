class Public::CommentsController < ApplicationController

  def index
    @work = Work.find(params[:work_id])
    @comment = Comment.new
    @comments = @work.comments.page(params[:page])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to work_comments_path
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.delete
    redirect_to  work_comments_path
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(work_id: params[:work_id],user_id: current_user.id)
  end

end

