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

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :no_intra_emphasis => true, :fenced_code_blocks => true, :autolink => true)
    syntax_highlighter(markdown.render(text)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML.fragment(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
