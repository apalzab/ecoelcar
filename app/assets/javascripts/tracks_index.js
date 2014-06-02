$('.tracks.index').ready(function () {
  $('#datetimepicker').datetimepicker({
      minDate: get_min_date(),
      useCurrent: false,
      format: 'DD/MM/YYYY',
      pickTime: false,
  });

  $('.input-group .date').click(function() {
    $('.input-group-addon').click();
  });

  function get_min_date() {
      var date = new Date();
      date.setDate((date.getDate() - 1));
      return date;
  }

  $('.routes input[type="submit"]').click(function() {
    var date = moment($('#datetimepicker input').val(), "DD/MM/YYYY HH:mm").format();
    $('#datetime').val(date);
  });

});
