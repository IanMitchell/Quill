atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated

  @posts.each do |post|
    next if post.updated_at.blank?

    feed.entry(post) do |entry|
      entry.url post_url(post)
      entry.title post.title
      entry.content post.content, :type => 'html'

      # Needed for Google Reader
      entry.updated(post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))

      entry.author do |author|
        author.name entry.author.name
      end
    end
  end
end