<% if @page.errors.any? %>
  $('#new-page-errors').slideUp( ->
    $('#new-page-errors').html ''
    $('<%= escape_javascript error_messages_for(@page) %>')
      .appendTo('#new-page-errors')
  )
  $('#new-page-errors').slideDown()
<% else %>
  # Remove local storage / cookie
  window.Store.expire 'page-title'
  window.Store.expire 'page-content'
  window.Store.expire 'page-header'
  window.Store.expire 'page-sidebar'
  
  # Redirect to post (?)
  window.location = '<%= page_url(@page) %>'
<% end %>