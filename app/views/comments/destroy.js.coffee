$('#comments h3').html '<%= comment_count %>'

$('#<%= dom_id(@comment) %>')
  .slideUp ->
    $(this).remove()