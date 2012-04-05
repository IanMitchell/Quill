class Comment < ActiveRecord::Base
  include Gravtastic

  validates :name,      :presence => true

  validates :content,   :presence => true

  validates :website,   :format => { :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix },
                        :allow_blank => true

  validates :email,     :presence => true,
                        :format => { :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i }

  belongs_to :post
  has_gravatar


  after_create :deliver_notification_email


  def deliver_notification_email
    CommentMailer.delay.comment_notification(self)
  end
end
