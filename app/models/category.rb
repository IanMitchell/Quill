class Category < ActiveRecord::Base
  validates :name,      :presence => true,
                        :uniqueness => true,
                        :length => { :minimum => 1, :maximum => 75 }
                        
  has_many :post_categories
  has_many :posts, :through => :post_categories
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
end
