tokenizeCategories = ->
  $(".tokenize").each (i, obj) ->
    $(this).tokenInput "/categories.json",
      crossDomain: false
      prePopulate: $(this).data("pre")
      theme: "facebook"
    return
  return

$(document).ready ->
  tokenizeCategories()
  $(document).on 'end.pjax', tokenizeCategories
  return