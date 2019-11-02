$(document).ready(function() {
    $('.js-formulario-basic-single').select2();
    $('#mostrar_formulario').click(function(e){
        e.preventDefault();
        showForm();
    });



    function showForm(event, ui) {
      var ruta_agrupacion  = $('#ruta_agrupacion').val();
      var ide_titulo       = $('#formularios').val();
      var output           = '';
      var output_sm6       = '';
      var output_sm12      = '';
      var output_uni       = '';

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
       .done(function( response, textStatus, jqXHR ) {
           if ( console && console.log ) {
               console.log( "La solicitud se ha completado correctamente." );
           }
           if (response.correcto) {
             //console.log( "Entró.");

             $.each(response.datos, function(key, value) {
               //console.log( "Agrupacion: " +  value.agru.agrupacion);
               //console.log("Registro:" + value );
               //console.log( "Etiqueta: " +  value.agru.eti.etiqueta);
               $.each(value.agru, function (keya, data) {
                  //console.log(keya)
                  $.each(data, function (indexa, agrupa) {
                      output_uni = '';
                      //console.log("Etiqueta:" + data.eti);
                      //console.log(indexa, agrupa);
                      // if(indexa == "eti"){
                      //   console.log("Entró al ETI");
                      // }
                      $.each(data.eti, function (keye, dataeti) {
                         $.each(dataeti, function (indexe, etique) {
                           if(dataeti.correctoe){
                             output_sm6 = "";
                             $.each(dataeti.datose, function (indexed, datostique) {
                               output_sm6+= '<div class="form-group col-sm-6">';
                                $.each(datostique, function (indexes, etiqued) {
                                  //console.log(indexes, etiqued);

                                  //console.log("tpo_val_etiqueta: " + datostique.tpo_val_etiqueta);
                                  if(datostique.tpo_val_etiqueta == "CHK"){
                                    output_sm6+= '<input type="checkbox" name="chk'+ datostique.ide_etiqueta +'" id="chk'+ datostique.ide_etiqueta +'" value="1">'+ datostique.etiqueta +'<br>';
                                  }




                                })
                               output_sm6+= '</div>';
                             })
                           }
                           else {

                           }
                           //console.log(indexe, etique)
                         })
                       })
                       output_uni = output_sm12 + output_sm6;
                  })
               })
               output = output_uni;

             })
             $("#formulario-container").html(output);
             $("#formulario-container").show();
           }
           else {
             console.log( "Entró al else");
           }
       })
       .fail(function( jqXHR, textStatus, errorThrown ) {
           if ( console && console.log ) {
               console.log( "La solicitud a fallado: " +  textStatus);
           }
      })


    }




});
