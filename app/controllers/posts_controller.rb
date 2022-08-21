class PostsController < ApplicationController
  def index
    @current_user = current_user
    @user = User.find(params[:user_id].to_i)
    @no_of_pages = (@user.posts_counter.to_f / 3).ceil
    @current_page = params[:page].nil? || params[:page].to_i < 1 ? 1 : params[:page].to_i
    @posts = Post.where(author: @user).order(id: :asc).limit(3).offset((@current_page - 1) * 3)
  end

  def new
    @current_user = current_user
    @post = Post.new
    @user = User.find(params[:user_id].to_i)
  end

  def create
    @current_user = current_user
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0
    @user = current_user

    if @post.save
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = 'Error creating post'
    end
  end

  def show
    @current_user = current_user
    @post = Post.find(params[:id].to_i)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
