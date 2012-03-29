class Page < ActiveRecord::Base
  validates :title,     :presence => true,
                        :uniqueness => true,
                        :length => { :minimum => 3, :maximum => 75 }
  
  validates :content,   :presence => true
  
  validates :rank,      :uniqueness => true,
                        :numericality => true

  validate :is_visible

  extend FriendlyId
  friendly_id :title, :use => :slugged

  mount_uploader :icon, PageUploader
  

  def is_visible
    if self.header.blank? && self.sidebar.blank?
      self.errors.add(:header, "Your page must be visible (choose Sidebar and/or Header).")
      self.errors.add(:sidebar, "Your page must be visible (choose Sidebar and/or Header).")
    end
  end
end