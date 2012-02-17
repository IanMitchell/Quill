$(document).ready ->
  $('.comment').live 'hover', ->
    controls = $(this).children("span").children("a.moderation")
    $(this).hover (->
      $(controls).fadeIn()
    ), ->
      $(controls).fadeOut()