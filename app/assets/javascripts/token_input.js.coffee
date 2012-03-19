tokenizeCategories = ->
  $(".tokenize").each (i, obj) ->
    $(this).tokenInput "/categories.json",
      crossDomain: false
      prePopulate: $(this).data("pre")
      theme: "facebook"
      hintText: "Type in a Category name..."
      preventDuplicates: true
    return
  return

$(document).ready ->
  tokenizeCategories()
  $(document).on 'end.pjax', tokenizeCategories
  return