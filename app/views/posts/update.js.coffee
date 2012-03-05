<% if @post.errors.any? %>
  $('#edit-post-errors').slideUp( ->
    $('#edit-post-errors').html ''
    $('<%= escape_javascript error_messages_for(@post) %>')
      .appendTo('#edit-post-errors')
  )
  $('#edit-post-errors').slideDown()
<% else %>

  # Remove local storage / cookie
  #window.Store.expire 'post-title'
  #window.Store.expire 'post-content'
  
  # Redirect to post
  window.location = '<%= post_url(@post) %>'
<% end %>