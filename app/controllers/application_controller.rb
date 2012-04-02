class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :admin_bar

  private

  def admin_bar
    if author_signed_in?
      @sort_pages = Page.order("rank")
      @contents = Content.all(:order => "created_at DESC")
      @new_page = Page.new
      @new_post = Post.new
      @new_content = Content.new
    end
  end
end
