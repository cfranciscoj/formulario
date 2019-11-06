$(document).ready(function() {

    //window.sessionStorage();

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

             output_uni = '';
             output_sm6 = '';
             output_sm12 = '\n';
             $.each(response.datos, function(key, value) {
               $.each(value, function (keya, data) {
                  if (keya == 0){
                   //Para completar lo que tiene que hacer la Agrupación
                   //console.log("key: " + keya + " data: " + data.agrupacion);
                  }
                  // output_uni += '\n';
                  // output_sm12 += '<div class="form-group col-sm-12"> </div>\n';
                  $.each(data.eti, function (keye, dataeti) {
                    //Sólo para las etiquetas finales
                    //console.log("correcto_eti = " + correcto_eti);
                    if(keye == "correctoe" && dataeti){
                      //console.log("Entró al if de la etiqueta correctoe = true");
                      //var correcto_eti = true;
                      window.sessionStorage.setItem('correcto_eti',true);
                    }
                    else {
                      //var correcto_eti = false;
                      window.sessionStorage.setItem('correcto_eti',false);
                    }


                      //console.log("correcto_eti = " + correcto_eti);
                      // console.log("dataeti: " + dataeti);
                      output_sm6 += '<div class="form-group col-sm-6">\n';
                      $.each(dataeti.datose, function (indexe, etique) {
                        correcto_eti = window.sessionStorage.getItem('correcto_eti');
                        console.log("correcto_eti = " + correcto_eti);
                        if(correcto_eti){
                          console.log("key: " + indexe + " data: " + etique.etiqueta);
                       //console.log("Etiqueta:" + indexe + ":" + etique);

                         //output_sm6 += '\n';

                            if(datostique.tpo_val_etiqueta == "CHK"){
                              output_sm6+= '\t<input type="checkbox" name="chk'+ etique.ide_etiqueta +'" id="chk'+ etique.ide_etiqueta +'" value="1">'+ etique.etiqueta +'<br>\n';
                            }

                        }
                       })
                       output_sm6+= '</div>\n';
                  })
                  output_uni = output_sm12 + output_sm6;
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
