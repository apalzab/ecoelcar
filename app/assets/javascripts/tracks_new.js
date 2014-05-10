$('.tracks.new').ready(function () {
  console.log('in paths new');
  initialize();


  function initialize() {
      console.log('initializing the map');


    $('#origin option').click(function() {
      var origin = $(this).data('latlng');
      var lat = origin.split(',')[0];
      var lng = origin.split(',')[1];
      origin = new google.maps.LatLng(lat, lng);
      origin_marker.setPosition(origin);
      map.setCenter(origin);

      if (destination_marker.getPosition() != null)
        calculateRoute();
    });

    $('#destination option').click(function() {
      var destination = $(this).data('latlng');
      var lat = destination.split(',')[0];
      var lng = destination.split(',')[1];
      destination = new google.maps.LatLng(lat, lng);
      destination_marker.setPosition(destination);
      map.setCenter(destination);
      map.setZoom(11);
      if (origin_marker.getPosition() != null)
        calculateRoute();
    });

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

    var directionsService = new google.maps.DirectionsService();
    var directionsDisplay = new google.maps.DirectionsRenderer();
    directionsDisplay.setMap(map);

    var origin_marker = new google.maps.Marker({
        map: map
      });

     var destination_marker = new google.maps.Marker({
        map: map
      });

    function calculateRoute() {
      var avoidTolls = $('.map_automatic_settings input[type="checkbox"]').is(':checked');
      var request = {
        origin: origin_marker.getPosition(),
        destination: destination_marker.getPosition(),
        travelMode: google.maps.TravelMode.DRIVING,
        provideRouteAlternatives: true,
        avoidTolls: avoidTolls
      };

      directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          directionsDisplay.setDirections(result);
          origin_marker.setMap(null);
          destination_marker.setMap(null);
          track_spots = result.routes[0].overview_path;
          $('#track_spots').text(track_spots.join(';'));
        }
      });
    }
  }

  function loadScript() {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyBmNZpoxu8WGGluEbJ1Q4cKChFN83z-ecU&sensor=false&callback=initialize&libraries=places";
    document.body.appendChild(script);
  }

});


  // window.onload = loadScript;

// $(document).ready(loadScript);
// $(document).on('page:load', loadScript);