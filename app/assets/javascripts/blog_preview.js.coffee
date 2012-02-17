$(document).ready ->
  $("#blog-roll #nav li a").live "click", ->
    $("#blog-roll #nav li.active").removeClass "active"
    $(this).parent().addClass "active"
    index = $(this).parent().index()
    $("#blog-roll .selected").fadeOut "medium", ->
      $("#blog-roll .selected").removeClass "selected"
      $("#blog-roll .post").eq(index).fadeIn "medium", ->
        $("#blog-roll .post").eq(index).addClass "selected"

    false