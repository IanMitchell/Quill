class HomepageController < ApplicationController
  def index
    @posts = Post.find(:all, :order => 'created_at DESC', :limit => 5)
  end

end
