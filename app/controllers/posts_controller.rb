class PostsController < ApplicationController
  def index
    @current_page = params['page'].nil? || params['page'].to_i < 1 ? 1 : params['page'].to_i
    @user = User.find(params['user_id'].to_i)
    @posts = Post.where(author: @user).order(id: :asc).limit(3).offset((@current_page - 1) * 3)
    @no_of_pages = (@user.posts_counter.to_f / 3).ceil
    @current_user = current_user
  end

  def new
    @post = Post.new
    @user = User.find(params['user_id'].to_i)
    @current_user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    @user = current_user
    @current_user = current_user

    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params['id'].to_i)
    @current_user = current_user
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
