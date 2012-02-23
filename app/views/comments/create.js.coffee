<% if @comment.errors.any? %>
  $('#comment-errors').slideUp( ->
    $('#comment-errors').html ''
    $('<%= escape_javascript error_messages_for(@comment) %>')
      .appendTo('#comment-errors')
  )
  $('#comment-errors').slideDown()
<% else %>
  $('<%= escape_javascript render(@comment) %>')
    .hide()
    .insertBefore('#new_comment')
    .slideDown()

  $('#comment-errors').slideUp()
  
  $('#new_comment')[0].reset()

  $('#comments h3').html '<%= comment_count %>'
<% end %>