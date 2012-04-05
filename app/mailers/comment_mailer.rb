class CommentMailer < ActionMailer::Base
  default :from => ENV['GMAIL_USERNAME']

  def comment_notification(comment)
    @comment = comment
    @post = comment.post
    mail(:to => @post.author.email, :subject => "New Comment Posted")
  end
end
