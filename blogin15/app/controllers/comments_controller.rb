class CommentsController < ApplicationController
  def create
    post = Post.find_by_id(params[:post_id])
    post.comments.create(comment_params)
    redirect_to post
  end

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
