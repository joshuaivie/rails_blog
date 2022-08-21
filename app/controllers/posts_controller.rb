class PostsController < ApplicationController
  def index
    @current_page = params['page'].nil? || params['page'].to_i < 1 ? 1 : params['page'].to_i
    @user = User.find(params['user_id'].to_i)
    @posts = Post.where(author: @user).order(id: :asc).limit(3).offset((@current_page - 1) * 3)
    @no_of_pages = (@user.posts_counter.to_f / 3).ceil
  end

  def show
    @post = Post.find(params['id'].to_i)
  end
end
