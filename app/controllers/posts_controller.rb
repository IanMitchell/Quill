class PostsController < ApplicationController
  respond_to :html, :js

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    if author_signed_in?
      @post = Post.new(params[:post])
      @post.author = current_author
      
      @post.save

      respond_with @post
    end
  end

  def update
    if author_signed_in?
      @post = Post.find(params[:id])

      @post.update_attributes(params[:post])

      respond_with @post
    end
  end

  def destroy
    if author_signed_in?
      @post = Post.find(params[:id])
      @post.destroy

      respond_with @post
    end
  end
  
  def feed
    @title = "Quill Feed"
    @posts = Post.order("created_at DESC")
    @updated = @posts.first.updated_at unless @posts.empty?
    
    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end
  end
end
