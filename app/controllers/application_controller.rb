class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :admin_bar

  private

  def admin_bar
    @sort_pages = Page.order("rank")
  	@new_page = Page.new
  	@new_post = Post.new
  end
end
