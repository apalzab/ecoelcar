$('.users.edit').ready(function () {
    console.log('in edit');
    $(function() {
      return $('.chosen-select').chosen({
              allow_single_deselect: true,
              no_results_text: 'No se encontró nada',
              text: 'ghgh'
      });
    });

    $('.vehicle-configuration').bind('DOMNodeInserted', function(event) {
        if ($('.chosen-single').length == 0) {
          return $('.chosen-select').chosen({
            allow_single_deselect: true,
            no_results_text: 'No se encontró nada',
              text: 'ghgh'
          });
        }
    });

  $(function() {
    $('.chosen-select.brand').ready( function() {
      var brand_name = $('.chosen-single.chosen-single-with-deselect span').text();
      set_models(brand_name);
    });
    $('.chosen-select.brand').on('change', function() {
      brand_name = $('.chosen-single.chosen-single-with-deselect span').text();
      set_models(brand_name);
    });
  });

     $(function() {
      $( "#slider-range-max" ).slider({
        range: "max",
        min: 40,
        max: 400,
        step: 5,
        value: $('#user_vehicles_attributes_0_horse_power').val(),
        slide: function( event, ui ) {
          $( "#user_vehicles_attributes_0_horse_power" ).val( ui.value );
        }
      });
      $( "#user_vehicles_attributes_0_horse_power" ).val( $( "#slider-range-max" ).slider( "value" ) );
    });

    function set_models(brand_name) {
      $.ajax({
        url: 'http://localhost:3000/vehicle_models.json',
        type: 'get',
        data: { 'brand_name': brand_name },
        success: function (data) {
          $('.chosen-select.model').html('');
          for (i = 0; i < data.length; i++) {
            $('.chosen-select.model').append("<option value=" + data[i].id + ">" + data[i].name + "</option>");
          }
        $(".chosen-select.model").trigger("chosen:updated");
        var model = $('#vehicle_model').data('model');
        $('#user_vehicles_attributes_0_vehicle_model_id_chosen a span').text(model);
        },
        error: function (jqXHR, textStatus, errorThrown){
                alert('error');
        }
      });
    }


});