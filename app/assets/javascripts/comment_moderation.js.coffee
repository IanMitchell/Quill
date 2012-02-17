# Courtesy of the madly brilliant David Walsh. I have a serious man-crush on him.
$(document).ready ->
  $("div.comment").each ->
    controls = $(this).children("span").children("a.moderation")
    $(this).hover (->
      $(controls).fadeIn()
    ), ->
      $(controls).fadeOut()