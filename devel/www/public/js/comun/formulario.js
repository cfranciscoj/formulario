$(document).ready(function() {




    $('.js-formulario-basic-single').select2();
    $('#mostrar_formulario').click(function(e){
        e.preventDefault();
        showForm_2();
    });


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
          url: ruta_agrupacion2,
          // syncronico
          async: false
          })
          .done(function( response, textStatus, jqXHR ) {
            var ide_agrupacion  = '0';
            var nom_agrupacion  = '';
            var out_etique      = '';
            var output_titulo     = '';
            var output_final      = '\n';

            console.log( "La solicitud se ha completado correctamente." );
            if (response.correcto) {

              output_titulo = '\n';
              $.each(response.agru, function(key, value) {
                  //console.log('value.ide_agrupacion: ' + value.ide_agrupacion + ' value.agrupacion: ' + value.agrupacion);
                  output_titulo = '\n';
                  out_etique = 0;
                  out_etique = trae_etiquetas(value.ide_agrupacion) + '\n';
                  //console.log('out_etique: '+ out_etique);
                  if (out_etique == 0){

                    if(value.tpo_val_agrupacion == "CHK"){
                      output_titulo += '\n<div class="form-group col-sm-12 list-chk skin-section">\n';
                      output_titulo += '\t<input type="checkbox" name="'+ value.ide_agrupacion +'" id="'+ value.ide_agrupacion +'" value="'+ value.ide_agrupacion +'"> '+ value.agrupacion +'<br>\n';
                      output_titulo += '\n</div>\n';
                    }
                    if(value.tpo_val_agrupacion == "TXT"){
                      output_titulo += '\n<div class="form-group col-sm-12">\n';
                      output_titulo += '\t<label for="txt-'+ value.ide_agrupacion +'">' + value.agrupacion + '</label>';
                      output_titulo += ' <input type="text" class="form-control" name="'+ value.ide_agrupacion +'" id="'+ value.ide_agrupacion +'"><br>\n';
                      output_titulo += '\n</div>\n';
                    }
                    if(value.tpo_val_agrupacion == "GLO"){
                      output_titulo += '\n<div class="form-group col-sm-12">\n';
                      output_titulo += '\t<label for="glo-'+ value.ide_agrupacion +'">' + value.agrupacion + '</label>';
                      output_titulo += ' <textarea rows="5" class="form-control" id="'+ value.ide_agrupacion +'" name="'+ value.ide_agrupacion +'"></textarea><br>\n';
                      output_titulo += '\n</div>\n';
                    }
                    if(value.tpo_val_agrupacion == "TIT"){
                      output_titulo += '\n<div class="form-group col-sm-12">\n';
                      output_titulo += value.agrupacion;
                      output_titulo += '\n</div>\n';
                    }




                  }
                  else {
                    output_titulo += '\n<div class="form-group col-sm-6">\n';
                    output_titulo += '\t<label for="lab-'+ value.ide_agrupacion +'">' + value.agrupacion + '</label>';
                    output_titulo += '\n</div>\n';
                    output_titulo = output_titulo + out_etique;
                  }

                  output_final += output_titulo;
                  //output_unificado += output_titulo + output_etiqueta;

              })
              //console.log("out_etique: " + output_titulo);
              //output_final += output_titulo;
              //console.log('output_final: ' + output_final);
              $("#formulario-container").html(output_final);
              $("#formulario-container").show();
              $("#formulario-fila").show();
            }
            else {
              //console.log( "Entró al else del response");
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
      var output_etiqueta = '\n';
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
          async: false
          })
          .done(function( respuesta, textStatus, jqXHR ) {
            if (respuesta.correctoe) {

              output_etiqueta = '\n<div class="form-group col-sm-6 list-chk skin-section">\n';
              $.each(respuesta.datose, function(keye, datae) {
              //  console.log( "key: " + keye + " value: " + datae.etiqueta );
                if(datae.tpo_val_etiqueta == "CHK"){
                  output_etiqueta += '\t<input type="checkbox" name="'+ datae.ide_etiqueta +'" id="'+ datae.ide_etiqueta +'" value="'+ datae.ide_etiqueta +'"> '+ datae.etiqueta +'<br>\n';
                }
                if(datae.tpo_val_etiqueta == "TXT"){
                  output_etiqueta += '\t<label for="'+ datae.ide_etiqueta +'">' + datae.etiqueta + '</label>';
                  output_etiqueta += ' <input type="text" class="form-control" name="'+ datae.ide_etiqueta +'" id="'+ datae.ide_etiqueta +'"><br>\n';
                }
                if(datae.tpo_val_etiqueta == "GLO"){
                  output_etiqueta += '\t<label for="gloe-'+ datae.ide_etiqueta +'">' + datae.etiqueta + '</label>';
                  output_etiqueta += ' <textarea rows="5" class="form-control" id="'+ datae.ide_etiqueta +'" name="'+ datae.ide_etiqueta +'"></textarea><br>\n';
                }
                if(datae.tpo_val_etiqueta == "RAD"){
                  output_etiqueta += '\t<input type="radio" name="'+ datae.ide_agrupacion +'" id="'+ datae.ide_agrupacion +'" value="'+ datae.ide_etiqueta +'"> '+ datae.etiqueta +'<br>\n';
                }
                if(datae.tpo_val_etiqueta == '0'){
                  output_etiqueta = '0';
                }
              })
              if (output_etiqueta != '0'){
                output_etiqueta += '</div>\n';
              }
              else {
                output_etiqueta = '0';
              }

              output_unificado += output_etiqueta;



            }
            else {
              output_unificado = '0';
              //console.log( "Entró al else de Etiqueta");
            }
              // console.log("output_unificado: " + output_unificado);
              // return output_unificado;

          })
          .fail(function( jqXHR, textStatus, errorThrown ) {
              if ( console && console.log ) {
                  console.log( "La solicitud a fallado: " +  textStatus);
                  output_unificado = '0';
                  return output_unificado;
              }
          })
          //console.log("output_unificado: " + output_unificado);
          return output_unificado;

    }

    $('#grabar_formulario').click(function(e){
        e.preventDefault();
        //showForm_2();
        var jsonObj = [];
        $("form input[type='radio']:checked").each(function() {
          //console.log("Valor de los Radio : " + this.id + " value: " + this.value);
          item = {}
          item ["ide"] = this.value;
          item ["valor"] = '1';

          jsonObj.push(item);

          $("#" + this.id).removeProp("checked");
          $("#" + this.id).prop("checked",false);
          $("#" + this.id).iCheck('update');

        });

        $("form input[type='checkbox']:checked").each(function() {
          //console.log("id checkbox: " + this.id + " value: " + this.value);
          item = {}
          item ["ide"] = this.id;
          item ["valor"] = '1';

          jsonObj.push(item);

          $("#" + this.id).removeProp("checked");
          $("#" + this.id).prop("checked",false);
          $("#" + this.id).iCheck('update');

        });
        //$("form input[type='checkbox']").prop("checked",true);

        $("form input[type='text'], textarea").each(function() {
          if (this.value != ""){
            //console.log("id text: " + this.id + " value: " + this.value);
            item = {}
            item ["ide"] = this.id;
            item ["valor"] = this.value;

            jsonObj.push(item);
            $('#'+this.id).val('');

          }

        });

        // $("form textarea").each(function() {
        //   console.log("id textarea: " + this.id + " value: " + this.value);
        // });

        if(jsonObj.length != 0){
          //console.log(jsonObj);
          graba_formulario(jsonObj);

        }
        else {
          console.log("jsonObj = vacio");
        }


        $("#frmFormularios")[0].reset();

    });

    function graba_formulario(valor){
      var ruta_grabador  = $('#ruta_grabador').val();

      $.ajax({
          headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
          // En data puedes utilizar un objeto JSON, un array o un query string
          data: {"valor" : valor},
          //Cambiar a type: POST si necesario
          type: "POST",
          // Formato de datos que se espera en la respuesta
          dataType: "json",
          // URL a la que se enviará la solicitud Ajax
          url: ruta_grabador,
          // syncronico
          async: false
          })
          .done(function( respuesta, textStatus, jqXHR ) {
            console.log( "Grabó los datos");

          })
          .fail(function( jqXHR, textStatus, errorThrown ) {
              if ( console && console.log ) {
                  console.log( "La solicitud de grabado a fallado: " +  textStatus);
              }
          })

    }





});
