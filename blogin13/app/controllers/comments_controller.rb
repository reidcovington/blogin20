class CommentsController < ApplicationController

  def create
    @post = Post.find_by_id(params[:post_id])
    @post.comments.create(params_comment)
    redirect_to @post
  end

  def destroy
    @post = Post.find_by_id(params[:post_id])
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
    redirect_to @post
  end

  def params_comment
    params.require(:comment).permit(:author, :body)
  end
end

