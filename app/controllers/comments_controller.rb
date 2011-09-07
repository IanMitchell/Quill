class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
        format.js
      else
        format.html { redirect_to post_path(@post) }
        format.js
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :ok }
    end
  end
end
