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
    options = [:hard_wrap, :filter_html, :autolink, ↵
      :no_intraemphasis, :fenced_code, :gh_blockcode]
    syntax_highlighter(Redcarpet.new(text, ↵
      *options).to_html).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
