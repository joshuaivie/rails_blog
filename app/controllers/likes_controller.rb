class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.author = current_user
    @like.post_id = params[:post_id].to_i

    if @like.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash[:error] = 'Error saving comment'
    end
  end
end
