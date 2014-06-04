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
    $('.white-wrap').hide();
    $('.navbar').hide();
    $('footer').hide();
    $('.page-wrap').hide();
    $('body').append('<article id="map" class="full" style="display:none"/></article><div id="directionsPanel" class="directions-panel"></div><button id="close-map" class="close-map">&times;</button>');
    var closeButton = document.querySelector('#button'),
    controlPosition = google.maps.ControlPosition.RIGHT_TOP;
    $('#map').show();
    initialize();
  });

  $('body').delegate('#close-map', 'click', function() {
    $('.white-wrap').show();
    $('.navbar').show();
    $('footer').show();
    $('.page-wrap').show();
    $('#map').remove();
    $('#directionsPanel').remove();
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

    var driver = new google.maps.MarkerImage('assets/driver.png');
    var user = new google.maps.MarkerImage('assets/user.png');

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
          icon: driver
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
            '<button class="btn btn-inverse" data-latitude=' + lat + ' data-longitude='+ lon +'>¿Cómo llegar hasta ahí?</button>' +
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
    
    locateUser();
    var Userposition;

    function locateUser() {
      if (navigator.geolocation)
        {
          navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            alert('No support for HTML5 geolocation.');
          }
    }

    function showPosition(position) {
      var latitude = position.coords.latitude;
      var longitude = position.coords.longitude;

      var latLng = new google.maps.LatLng(latitude, longitude);
      var user_marker = new google.maps.Marker({
        position: latLng,
        map: map,
        icon: user
      });
      UserPosition = latLng;
    }

    $('#map').delegate('.btn-inverse', "click", function() {
      closeInfoWindows();
      var travel_mode = $(this).closest('div').find('select').val();
      var alternative_routes = $(this).closest('div').find('input[type="checkbox"]:eq(0)').is(':checked');
      var avoidTolls = $(this).closest('div').find('input[type="checkbox"]:eq(1)').is(':checked');
      calculateRoute($(this).data('latitude'), $(this).data('longitude'), travel_mode, alternative_routes, avoidTolls);
      $('#map').css('width', '80%');
    });

    var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer();
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById("directionsPanel"));

    function calculateRoute(latitude, longitude, travel_mode, alternative_routes, avoidTolls) {

      if (travel_mode == "Caminando")
        travel_mode = google.maps.TravelMode.WALKING;
      else if (travel_mode == "Transporte público")
        travel_mode = google.maps.TravelMode.TRANSIT;
      else if (travel_mode == "Bicicleta")
        travel_mode = google.maps.TravelMode.BICYCLING;
      else travel_mode = google.maps.TravelMode.DRIVING;

      var request = {
        origin: UserPosition,
        destination: new google.maps.LatLng(latitude,longitude),
        travelMode: travel_mode,
        provideRouteAlternatives: alternative_routes,
        avoidTolls: avoidTolls
      };

      directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          directionsDisplay.setDirections(result);
        }
      });
    }

  } //ends initialize

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

