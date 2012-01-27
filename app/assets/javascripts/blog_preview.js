$(document).ready(function() {
  $('#blog-roll #nav li a').live('click', function () {
    $('#blog-roll #nav li.active').removeClass('active');
    $(this).parent().addClass('active');

    var index = $(this).parent().index();

    $('#blog-roll .selected').fadeOut('medium', function() {
      $('#blog-roll .selected').removeClass('selected');
      $('#blog-roll .post').eq(index).fadeIn('medium', function() {
        $('#blog-roll .post').eq(index).addClass('selected');
      });
    });

    return false;
  });
});