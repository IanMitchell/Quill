/* when the dom is ready... */
$(document).ready(function(){
  /* hide all controls right away */
  $('div.moderation').css('visibility','hidden');
  /* add events for show/hide */
  $('div.comment').each(function() {
    var controls = $(this).children('div.moderation');
    $(this).hover(
      function() { $(controls).css('visibility','visible') },
      function() { $(controls).css('visibility','hidden') }
    );
  });
});