class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:id].to_i)
  end
end
