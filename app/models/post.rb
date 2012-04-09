class Post < ActiveRecord::Base

  validates :title,     :presence => true,
                        :length => { :minimum => 3, :maximum => 75 }
  
  validates :content,   :presence => true                      
                        
  belongs_to :author
  has_many :post_categories
  has_many :categories, :through => :post_categories
  has_many :comments, :order => "created_at ASC"

  attr_reader :category_tokens
  
  extend FriendlyId
  friendly_id :title, :use => :slugged
  

  def article
    self.content.gsub('<!-- excerpt -->', '')
  end

  def excerpt
    self.content.split('<!-- excerpt -->')[0]
  end

  def category_tokens=(tokens)
    ids = Array.new
    tokens.split(",").each do |c| 
      if Category.exists?(:name => c)
        cat = Category.find_by_name(c)
      else
        cat = Category.new(:name => c)
        cat.save
      end

      ids.push(cat.id)
    end

    self.category_ids = ids
  end
end
