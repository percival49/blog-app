class CommentsController < ApplicationController
  include ApplicationHelper

  def new

  end

  def create
    @comment = Comment.new comment_params

    @comment.user_id = current_user.id
    @comment.blog_id = params[:id]
    if @comment.save
      redirect_to blog_path(params[:id])
    else
      redirect_to blog_path(params[:id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
