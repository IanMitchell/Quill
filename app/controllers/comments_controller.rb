class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    
    @comment.save

    respond_with @comment, :location => posts_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    @comment.destroy

    respond_with @comment, :location => posts_path(@post)
  end
end
