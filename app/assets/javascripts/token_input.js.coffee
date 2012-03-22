tokenizeCategories = ->
  tb = new $.TextboxList("#post_category_tokens",
    unique: true
    plugins:
      autocomplete: {}
  )
  tb.getContainer().addClass "textboxlist-loading"
  $.ajax
    url: "/categories.json"
    dataType: "json"
    success: (r) ->
      tb.plugins["autocomplete"].setValues r
      tb.getContainer().removeClass "textboxlist-loading"
  return

$(document).ready ->
  tokenizeCategories()
  $(document).on 'end.pjax', tokenizeCategories
  return