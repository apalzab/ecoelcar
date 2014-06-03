$('.tracks.index').ready(function () {
  initialize();
  $('#datetimepicker').datetimepicker({
      minDate: get_min_date(),
      useCurrent: false,
      format: 'DD/MM/YYYY',
      pickTime: false,
  });

  $('.input-group .date').click(function() {
    $('.input-group-addon').click();
  });

  $('.routes .search .form-dates .map-link').click(function() {
    $('.white-wrap').hide('slow');
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

  function initialize() {

    var mapOptions = {
      zoom: 13,
      center: new google.maps.LatLng(43.257143,-2.924865),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: true,
      mapTypeControlOptions: {
        position: google.maps.ControlPosition.BOTTOM
      }
    };
    map = new google.maps.Map(document.getElementById("map"), mapOptions);

    var trafficLayer = new google.maps.TrafficLayer();
    trafficLayer.setMap(map);

    // var socket = new google.maps.MarkerImage('static/img/charge_map.png');
    // var user = new google.maps.MarkerImage('static/img/user.png');

      // Adding markers to the map
    var deusto_marker = new google.maps.Marker({
        position: new google.maps.LatLng(43.271026,-2.938458),
        map: map,
        // icon: socket
    });
  }

  // function loadScript() {
  //   var script = document.createElement("script");
  //   script.type = "text/javascript";
  //   script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyBmNZpoxu8WGGluEbJ1Q4cKChFN83z-ecU&sensor=false&callback=initialize&libraries=places";
  //   document.body.appendChild(script);
  // }

});

