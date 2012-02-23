class ArchivesController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def category
    category = Category.find(params[:category])
    @posts = category.posts
    render :index
  end
  
  def date
    if params[:month]
      date = Time.parse("#{params[:month]} #{params[:year]}")
      @posts = Post.where(:created_at => date..(date + 1.month))
    else
      date = Time.parse("January #{params[:year]}")
      @posts = Post.where(:created_at => date..(date + 1.year))
    end
    render :index
  end
end
