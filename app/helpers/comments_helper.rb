module CommentsHelper
  def comment_count
    pluralize @post.comments.count, 'Comment'
  end
end
