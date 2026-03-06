class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @posts = @user.posts
  end
  def show

  end
  def edit

  end
end
