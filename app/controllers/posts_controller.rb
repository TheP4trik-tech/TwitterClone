class PostsController < ApplicationController
  before_action :authenticate_user!


  def index
    @posts = Post.all
  end
  def create

  end
  def destroy

  end
  def show
    @post = Post.find(params[:id])
    redirect_to posts_path unless @post.user == current_user
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params) && @post.user == current_user
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end

  end
  def edit
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :status, :body)
  end
end
