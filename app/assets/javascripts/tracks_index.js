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

  $('.routes .search .form-dates .map-link').click(function() {
    $('.white-wrap').hide('slow');
    $('#map').show();
    initialize();
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

    infowindows = [];

    // Adding markers to the map
    get_pick_up_points(function(stations) {
      $(stations).each(function(index, station) {
        var latlng = station.latlng;
        latlng = latlng.split(',');
        var lat = latlng[0];
        var lon = latlng[1];
        var marker = new google.maps.Marker({
          position: new google.maps.LatLng(lat, lon),
          map: map,
          // icon: socket
        });

        var marker_content =
          '<div>' +
            '<h4>' + station.name + '</h4>' +
            '<p><strong>Dirección:</strong></p>' +
            '<p><strong>Cómo llegar hasta ahi</strong></p>' +
            '<select class="span2">' +
                      '<option>Caminando</option>' +
                      '<option>Coche</option>' +
                      '<option>Transporte público</option>' +
                      '<option>Bicicleta</option>' +
            '</select>' +
            '<p><input type = "checkbox" id = "severalRoutes"' +
            '<label for = "severalRoutes">Mostrar varias rutas</label></p>' +
            '<button class="btn btn-inverse" data-latitude="43.271026" data-longitude="-2.938458">¿Cómo llegar hasta ahí?</button>' +
          '</div>';

        var infowindow = new google.maps.InfoWindow();
        infowindow.setContent(marker_content);
        infowindows.push(infowindow);

        google.maps.event.addListener(marker, 'click', function() {
          closeInfoWindows();
          infowindow.open(map, marker);
        });
      });
    });
    
  }

  function closeInfoWindows() {
    for (i = 0; i < infowindows.length; i++ ) {
      infowindows[i].close();
    }
  }

  function get_pick_up_points(callback) {
    $.ajax({
        url: '/stations.json',
        type: 'get',
        success: function (points) {
          callback(points);
        },
        error: function (jqXHR, textStatus, errorThrown){
        }
      });
  }

  // function loadScript() {
  //   var script = document.createElement("script");
  //   script.type = "text/javascript";
  //   script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyBmNZpoxu8WGGluEbJ1Q4cKChFN83z-ecU&sensor=false&callback=initialize&libraries=places";
  //   document.body.appendChild(script);
  // }

});

