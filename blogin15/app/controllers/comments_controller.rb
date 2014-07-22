class CommentsController < ApplicationController
  before_filter do
    @post = Post.find_by_id(params[:post_id])
  end

  def create
    @post.comments.create(comment_params)
    redirect_to @post
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    redirect_to @post
  end

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
