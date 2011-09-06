module ApplicationHelper
  
  def header_pages
    Page.all(:order => 'rank', :conditions => { :header => true })
  end
  
  def sidebar_pages
    Page.all(:order => 'rank', :conditions => { :sidebar => true })
  end
  
end
