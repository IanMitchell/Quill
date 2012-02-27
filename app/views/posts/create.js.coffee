<% if @post.errors.any? %>
  $('#post-errors').slideUp( ->
    $('#post-errors').html ''
    $('<%= escape_javascript error_messages_for(@post) %>')
      .appendTo('#post-errors')
  )
  $('#post-errors').slideDown()
<% else %>
  $('#new_post')[0].reset()

  # Cancel Modal (?)
  # Notification it was posted

  # Remove local storage / cookie
  window.Store.expire 'post-title'
  window.Store.expire 'post-content'
  
  # Redirect to post (?)
<% end %>