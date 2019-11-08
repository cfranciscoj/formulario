$(document).ready(function() {

    //window.sessionStorage();
    //$("#formulario-fila").hide();

    class OutEti {
      constructor() {
        this.etiqueta = '';
      }
      act_etiqueta(brand) {
        this.etiqueta = brand;
      }
      out_etiqueta() {
        return this.etiqueta;
      }
    }


    $('.js-formulario-basic-single').select2();
    $('#mostrar_formulario').click(function(e){
        e.preventDefault();
        showForm_2();
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
           var correcto_agru    = false;
           var nombre_agru      = '';

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
                     correcto_agru = true;
                     nombre_agru = data.agrupacion;
                   }
                   else{
                     correcto_agru = false;
                     nombre_agru = '';
                   }
                  // output_uni += '\n';
                  // output_sm12 += '<div class="form-group col-sm-12"> </div>\n';
                  $.each(data.eti, function (keye, dataeti) {
                    //console.log("keya: " + keya + " data: " + nombre_agru + ' keye: ' + keye + ' !dataeti: ' + !dataeti);
                    if (correcto_agru && keye == "correctoe" && !dataeti){
                     //Para completar lo que tiene que hacer la Agrupación
                     console.log("data: " + nombre_agru);
                     output_sm12 += '<div class="form-group col-sm-12">'+ nombre_agru +'</div>\n';
                    }

                    //Sólo para las etiquetas finales
                    if(keye == "correctoe" && dataeti){

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
                  output_uni += output_sm12 + output_sm6;
                  output_sm12 = '';
                  output_sm6 = '';
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
                   //console.log('chk: ' + this.id);
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

    function showForm_2(event, ui) {
      var ruta_agrupacion2  = $('#ruta_agrupacion2').val();
      var ide_titulo        = $('#formularios').val();


      //var obj_etiqueta      = new OutEti();

      $.ajax({
          headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
          // En data puedes utilizar un objeto JSON, un array o un query string
          data: {"ide_titulo" : ide_titulo},
          //Cambiar a type: POST si necesario
          type: "POST",
          // Formato de datos que se espera en la respuesta
          dataType: "json",
          // URL a la que se enviará la solicitud Ajax
          url: ruta_agrupacion2
          })
          .done(function( response, textStatus, jqXHR ) {
            var ide_agrupacion  = '0';
            var nom_agrupacion  = '';
            var out_etique      = '';
            var output_titulo     = '';
            var output_final      = '\n';

            console.log( "La solicitud se ha completado correctamente." );
            if (response.correcto) {


              $.each(response.agru, function(key, value) {
                  out_etique += trae_etiquetas(value.ide_agrupacion) + '\n';


                  //output_unificado += output_titulo + output_etiqueta;
                  console.log("out_etique: " + out_etique);
              })
              output_final += out_etique;
              $("#formulario-container").html(output_final);
              $("#formulario-container").show();
              $("#formulario-fila").show();
            }
            else {
              console.log( "Entró al else del response");
              $("#formulario-fila").hide();
            }
            $('.list-chk input').on('ifCreated ifClicked ifChanged ifChecked ifUnchecked', function(event){
                    //console.log('chk: ' + this.id);
                    }).iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%'
            });
          })
          .fail(function( jqXHR, textStatus, errorThrown ) {
              if ( console && console.log ) {
                  console.log( "La solicitud a fallado: " +  textStatus);
                  $("#formulario-fila").hide();
              }
          })

    }

// Trae etiquetas listas para imprimir
    function trae_etiquetas(ide_agrupa){
      var ruta_etiqueta2  = $('#ruta_etiqueta2').val();
      var output_etiqueta   = '\n';
      var output_unificado  = '';
      $.ajax({
          headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
          // En data puedes utilizar un objeto JSON, un array o un query string
          data: {"ide_agrupacion" : ide_agrupa},
          //Cambiar a type: POST si necesario
          type: "POST",
          // Formato de datos que se espera en la respuesta
          dataType: "json",
          // URL a la que se enviará la solicitud Ajax
          url: ruta_etiqueta2,
          // syncronico
          async: false,
          })
          .done(function( respuesta, textStatus, jqXHR ) {
            if (respuesta.correctoe) {

              output_etiqueta = '\n<div class="form-group col-sm-6 list-chk skin-section">\n';
              $.each(respuesta.datose, function(keye, datae) {
              //  console.log( "key: " + keye + " value: " + datae.etiqueta );
                if(datae.tpo_val_etiqueta == "CHK"){
                  output_etiqueta += '\t<input type="checkbox" name="chke-'+ datae.ide_etiqueta +'" id="chke-'+ datae.ide_etiqueta +'" value="1"> '+ datae.etiqueta +'<br>\n';
                }
              })
              output_etiqueta += '</div>\n';
              output_unificado += output_etiqueta;



            }
            else {
              output_unificado = '';
              //console.log( "Entró al else de Etiqueta");
            }
              // console.log("output_unificado: " + output_unificado);
              // return output_unificado;

          })
          .fail(function( jqXHR, textStatus, errorThrown ) {
              if ( console && console.log ) {
                  console.log( "La solicitud a fallado: " +  textStatus);
                  output_unificado = '';
                  return output_unificado;
              }
          })
          console.log("output_unificado: " + output_unificado);
          return output_unificado;

    }

});
