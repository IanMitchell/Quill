 # create a custom renderer that allows highlighting of code blocks
class HTMLwithAlbino < Redcarpet::Render::HTML
  def block_code(code, language)
    RubyPython.start(:python_exe => "python2.6")
    Pygments.highlight(code, :lexer => language)
  end
end

module ApplicationHelper
  include Twitter::Autolink

  def site_title
    "Quill"
  end

  def header_pages
    Page.all(:order => 'rank', :conditions => { :header => true })
  end

  def sidebar_pages
    Page.all(:order => 'rank', :conditions => { :sidebar => true })
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(HTMLwithAlbino, :fenced_code_blocks => true, :no_intra_emphasis => true, :autolink => true, :strikethrough => true)
    markdown.render(text).html_safe
  end
end