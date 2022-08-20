class PostsController < ApplicationController
  def index
    @user = User.find(params['user_id'].to_i)
    @posts = Post.where(author: @user).order(id: :desc).limit(3)
  end

  def show
    @post = Post.find(params['id'].to_i)
  end
end
