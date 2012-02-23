class Post < ActiveRecord::Base

  validates :title,     :presence => true,
                        :length => { :minimum => 3, :maximum => 75 }
  
  validates :content,   :presence => true                      
                        
  belongs_to :author
  has_many :post_categories
  has_many :categories, :through => :post_categories
  has_many :comments
  
  extend FriendlyId
  friendly_id :title, :use => :slugged
  

  def article
    self.content.gsub('<!--excerpt-->', '')
  end

  def excerpt
    self.content.split('<!--excerpt-->')[0]
  end
end
