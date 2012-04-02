class Content < ActiveRecord::Base
  validates :file,      :presence => true
  
  mount_uploader :file, ContentUploader
end
