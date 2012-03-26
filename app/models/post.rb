class Post < ActiveRecord::Base

  validates :title,     :presence => true,
                        :length => { :minimum => 3, :maximum => 75 }
  
  validates :content,   :presence => true                      
                        
  belongs_to :author
  has_many :post_categories
  has_many :categories, :through => :post_categories
  has_many :comments

  attr_reader :category_tokens
  
  extend FriendlyId
  friendly_id :title, :use => :slugged
  

  def article
    self.content.gsub('<!--excerpt-->', '')
  end

  def excerpt
    self.content.split('<!--excerpt-->')[0]
  end

  # Existing Categories return an ID, while new
  # ones return a String. 
  def category_tokens=(tokens)
    ids = Array.new
    tokens.split(",").each do |c| 
      # Determines if a Number (If not, it means new category)
      if c.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil
        cat = Category.new
        cat.name = c
        cat.save
        c = cat.id
      end

      ids.push(c)
    end

    self.category_ids = ids
  end
end
