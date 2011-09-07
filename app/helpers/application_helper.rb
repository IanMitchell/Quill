module ApplicationHelper
  include Twitter::Autolink
  
  def header_pages
    Page.all(:order => 'rank', :conditions => { :header => true })
  end
  
  def sidebar_pages
    Page.all(:order => 'rank', :conditions => { :sidebar => true })
  end
  
  def start_year
    Post.first.created_at.strftime("%Y")
  end
end
