$(document).ready(function() {
    $('.js-formulario-basic-single').select2();
    $('#mostrar_formulario').click(function(){
        showForm();
    });

    function showForm(event, ui) {
      var ruta_agrupacion  = $('#ruta_agrupacion').val();
      var ruta_etiqueta    = $('#ruta_etiqueta').val();
      var ide_titulo       = $('#formularios').val();

      $.ajax({
          headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
          // En data puedes utilizar un objeto JSON, un array o un query string
          data: {"ide_titulo" : ide_titulo},
          //Cambiar a type: POST si necesario
          type: "POST",
          // Formato de datos que se espera en la respuesta
          dataType: "json",
          // URL a la que se enviará la solicitud Ajax
          url: ruta_agrupacion,
      })
       .done(function( data, textStatus, jqXHR ) {
           if ( console && console.log ) {
               console.log( "La solicitud se ha completado correctamente." );
           }
           
       })
       .fail(function( jqXHR, textStatus, errorThrown ) {
           if ( console && console.log ) {
               console.log( "La solicitud a fallado: " +  textStatus);
           }
      })


    }




});
