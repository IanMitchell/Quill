$('#<%= dom_id(@content) %>')
  .slideUp ->
    $(this).remove()