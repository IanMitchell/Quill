$ ->
  $(".tokenize").each (i, obj) ->
    $(this).tokenInput "/categories.json",
      crossDomain: false
      prePopulate: $(this).data("pre")
      theme: "facebook"