$(document).ready(function() {
  $('#blog-preview #nav li a').live('click', function () {
    $('#blog-preview #nav li.active').removeClass('active');
    $(this).parent().addClass('active');
    
    var index = $(this).parent().index();
    
    $('#blog-preview .selected').fadeOut('medium', function() {
      $('#blog-preview .selected').removeClass('selected');
      $('#blog-preview .post').eq(index).fadeIn('medium', function() {
        $('#blog-preview .post').eq(index).addClass('selected');
      });
    });

    return false;    
  });
});