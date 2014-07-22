class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.order("created_at desc")
    respond_with @posts
  end

  def new
    @post = Post.find_by_id(params[:id])
  end

  def create
    p params
    @post = Post.create(user_params)
    redirect_to posts_path
  end

  def user_params
    params.require(:post).permit(:title, :body)
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end
end
