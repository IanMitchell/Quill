class Page < ActiveRecord::Base
  validates :title,     :presence => true,
                        :uniqueness => true,
                        :length => { :minimum => 3, :maximum => 75 }
  
  validates :content,   :presence => true
  
  validates :rank,     :uniqueness => true,
                        :numericality => true
                        
  extend FriendlyId
  friendly_id :title, :use => :slugged

  mount_uploader :icon, PageUploader
  
end