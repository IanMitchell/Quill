<% if @post.errors.any? %>
  $('#new-post-errors').slideUp( ->
    $('#new-post-errors').html ''
    $('<%= escape_javascript error_messages_for(@post) %>')
      .appendTo('#new-post-errors')
  )
  $('#new-post-errors').slideDown()
<% else %>

  # Remove local storage / cookie
  window.Store.expire 'post-title'
  window.Store.expire 'post-content'
  
  # Redirect to post
  window.location = '<%= post_url(@post) %>'
<% end %>