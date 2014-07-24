class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.all
    respond_with @posts
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)

    if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update_attributes(params_post)

    if @post.save
      redirect_to posts_path
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def params_post
    params.require(:post).permit(:title, :body)
  end
end
