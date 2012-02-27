<% if @post.errors.any? %>
  $('#page-errors').slideUp( ->
    $('#page-errors').html ''
    $('<%= escape_javascript error_messages_for(@page) %>')
      .appendTo('#page-errors')
  )
  $('#page-errors').slideDown()
<% else %>
  $('#new_page')[0].reset()

  # Cancel Modal (?)
  # Notification it was posted

  # Remove local storage / cookie
  window.Store.expire 'page-title'
  window.Store.expire 'page-content'
  window.Store.expire 'page-header'
  window.Store.expire 'page-sidebar'
  
  # Redirect to post (?)
<% end %>