<% if @page.errors.any? %>
  $('#edit-page-errors').slideUp( ->
    $('#edit-page-errors').html ''
    $('<%= escape_javascript error_messages_for(@page) %>')
      .appendTo('#edit-page-errors')
  )
  $('#edit-page-errors').slideDown()
<% else %>

  # Remove local storage / cookie
  #window.Store.expire 'post-title'
  #window.Store.expire 'post-content'
  
  # Redirect to post
  window.location = '<%= page_url(@page) %>'
<% end %>