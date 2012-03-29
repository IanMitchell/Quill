sortablePages = ->
  $("#page_reorder").sortable(
    axis: 'y'
    handle: '.handle'
    update: ->
      # Update Sidebar Order
      $.each($(this).sortable('toArray'), (i, val) ->
        $("#aside_" + val).appendTo("aside")
        $("#header_" + val).appendTo("nav ul")
      )
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  )
  return

$(document).ready ->
  sortablePages()
  $(document).on 'end.pjax', sortablePages
  return