$('.bookings.index').ready(function () {
  console.log('in bookings index');

  $('nav a').click(function() {
    $("nav a").removeClass('active');
    $(this).addClass('active');
    if ($('.tracks').is(":visible")) {
      $('.tracks').hide();
      $('.reservations').show();
    } else {
        $('.tracks').show();
        $('.reservations').hide();
      }
  });
});
