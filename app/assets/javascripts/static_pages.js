$(document).ready(function() {
  $('.header ul li').click(function() {
    var scroll_to = $(this).data('scroll');
     $('html,body').animate({scrollTop: $(scroll_to).position().top}, 2500);
  });
});