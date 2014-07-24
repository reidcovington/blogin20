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
  end

  def update
  end

  def destroy
  end

  def show
  end

  def params_post
    params.require(:post).permit(:title, :body)
  end
end
