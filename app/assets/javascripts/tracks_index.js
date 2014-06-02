$('.tracks.index').ready(function () {
  $('#datetimepicker').datetimepicker({
      minDate: get_min_date(),
      useCurrent: false,
      format: 'DD/MM/YYYY',
      pickTime: false,
  });

  function get_min_date() {
      var date = new Date();
      date.setDate((date.getDate() - 1));
      return date;
  }

  $('.routes input[type="submit"]').click(function() {
    var date = new Date($('#datetimepicker input').val());
    $('#datetime').val(date);
    alert(date);
  });

});
