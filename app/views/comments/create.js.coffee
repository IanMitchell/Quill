<% if @comment.errors.any? %>
  $('#errors').slideUp( ->
    $('#errors').html ''
    $('<%= escape_javascript error_messages_for(@comment) %>')
    .appendTo('#errors')
  )
  $('#errors').slideDown()
<% else %>
  $('<%= escape_javascript render(@comment) %>')
    .hide()
    .insertBefore('#new_comment')
    .slideDown()

  $('#errors').slideUp()
  
  $('#new_comment')[0].reset()

  $('#comments h3').html '<%= comment_count %>'
<% end %>