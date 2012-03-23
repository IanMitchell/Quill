tokenizeCategories = ->
  tb_new = new $.TextboxList("#new_post #post_category_tokens",
    unique: true
    plugins:
      autocomplete: {}
  )
  tb_edit = new $.TextboxList(".edit_post #post_category_tokens",
    unique: true
    plugins:
      autocomplete: {}
  )

  pre = $(".edit_post #post_category_tokens").attr("data-pre").split(",")
  $.each pre, (i, val) ->
    tb_edit.add val


  tb_new.getContainer().addClass "textboxlist-loading"
  tb_edit.getContainer().addClass "textboxlist-loading"
  $.ajax
    url: "/categories.json"
    dataType: "json"
    success: (r) ->
      tb_new.plugins["autocomplete"].setValues r
      tb_edit.plugins["autocomplete"].setValues r
      tb_new.getContainer().removeClass "textboxlist-loading"
      tb_edit.getContainer().removeClass "textboxlist-loading"
  return

$(document).ready ->
  tokenizeCategories()
  $(document).on 'end.pjax', tokenizeCategories
  return