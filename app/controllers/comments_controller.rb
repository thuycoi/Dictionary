class CommentsController < ApplicationController
  def create
    @gword = Gword.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to_ gword_path(@gword)
end
