$('#comments h3').html '<%= comment_count %>'

$('#<%= dom_id(@comment) %>')
  .fadeOut ->
    $(this).remove()