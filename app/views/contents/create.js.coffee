<% if @content.errors.any? %>
  $('#content_errors').slideUp( ->
    $('#content_errors').html ''
    $('<%= escape_javascript error_messages_for(@content) %>')
      .appendTo('#content_errors')
  )
  $('#content_errors').slideDown()
<% else %>
  $('<%= escape_javascript render(@content) %>')
    .hide()
    .prependTo('.files')
    .slideDown()

  $('#content_errors').slideUp()

  $('#new_content')[0].reset()
<% end %>