class CommentsController < ApplicationController
  def create
    @current_user = current_user
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post_id = params[:post_id].to_i
    @comment.save
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
