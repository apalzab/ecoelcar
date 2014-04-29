var ready;
ready = function() {

  $('.header ul li').click(function() {
    var scroll_to = $(this).data('scroll');
    $('html,body').animate({scrollTop: $(scroll_to).position().top}, 2500);
  });

  $('#sign-in-nav').on('click',function() {
    $('.new-user').modal('show');
  });

  $('#sign-up-bottom').click(function() {
    $('.new-user').modal('show');
  });

  $('#login-nav').click(function() {
    $('.login').modal('show');
  });

  $('#login-bottom').click(function() {
    $('.login').modal('show');
  });

  setTimeout(function() {
      $(".notice").hide("slow");
      console.log('executed');
  }, 7000);

};

$(document).ready(ready);
$(document).on('page:load', ready);
