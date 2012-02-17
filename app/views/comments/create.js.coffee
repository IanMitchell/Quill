$('<%= escape_javascript render(@comment) %>')
  .hide()
  .insertBefore('#new_comment')
  .slideDown()

  $('#new_comment')[0].reset()

  $('#comments h3').html '<%= comment_count %>'