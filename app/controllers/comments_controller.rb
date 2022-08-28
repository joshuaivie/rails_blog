class CommentsController < ApplicationController
  def create
    @current_user = current_user
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post_id = params[:post_id].to_i

    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash[:error] = 'Error saving comment'
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Comment deleted.'
  end

  private

  def comment_params
    params.permit(:text)
  end
end
