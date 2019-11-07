$(document).ready(function() {

    //window.sessionStorage();
    //$("#formulario-fila").hide();

    $('.js-formulario-basic-single').select2();
    $('#mostrar_formulario').click(function(e){
        e.preventDefault();
        showForm();
    });

    // $('.input[type="checkbox"]').on('ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed', function(event){
    //           callbacks_list.prepend('<li><span>#' + this.id + '</span> is ' + event.type.replace('if', '').toLowerCase() + '</li>');
    //         }).iCheck({
    //     checkboxClass: 'icheckbox_square-blue',
    //     radioClass: 'iradio_square-blue',
    //     increaseArea: '20%'
    // });




    function showForm(event, ui) {
      var ruta_agrupacion  = $('#ruta_agrupacion').val();
      var ide_titulo       = $('#formularios').val();
      var output           = '';
      var output_sm6       = '';
      var output_sm12      = '';
      var output_uni       = '';
      var correcto_eti     = false;

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
                    if(keye == "correctoe" && dataeti){
                      //correcto_eti = true;
                      output_sm6 += '<div class="form-group col-sm-6 list-chk skin-section">\n';
                      $.each(data.eti.datose, function (indexe, etique) {
                          //console.log("key: " + indexe + " data: " + etique.etiqueta);
                          //output_sm6 += '\n';
                          if(etique.tpo_val_etiqueta == "CHK"){
                            output_sm6+= '\t<input type="checkbox" name="chke-'+ etique.ide_etiqueta +'" id="chke-'+ etique.ide_etiqueta +'" value="1"> '+ etique.etiqueta +'<br>\n';
                          }

                       })
                       output_sm6+= '</div>\n';
                    }
                  })
                  output_uni = output_sm12 + output_sm6;
               })
               output = output_uni;

              })
              $("#formulario-container").html(output);
              $("#formulario-container").show();
              $("#formulario-fila").show();
           }
           else {
             console.log( "Entró al else");
             $("#formulario-fila").hide();
           }
           $('.list-chk input').on('ifCreated ifClicked ifChanged ifChecked ifUnchecked', function(event){
                   console.log('chk: ' + this.id);
                   }).iCheck({
               checkboxClass: 'icheckbox_square-blue',
               radioClass: 'iradio_square-blue',
               increaseArea: '20%'
           });
       })
       .fail(function( jqXHR, textStatus, errorThrown ) {
           if ( console && console.log ) {
               console.log( "La solicitud a fallado: " +  textStatus);
           }
      })


    }




});
