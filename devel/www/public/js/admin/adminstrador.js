$(document).ready(function() {

    $('.js-formulario-basic-single').select2({
        width: '100%'
    });
    //console.log("Hola");
    $('#mostrar-respuestas').click(function(e){
        e.preventDefault();
        $("#respuestas-container").hide();
        showListado();

    });

    function showListado(event, ui) {
        var ruta       = $('#ruta-respuestas').val();
        var ide_titulo = $('#formularios').val();


        if ( $.fn.dataTable.isDataTable('#tabla-respuestas')) {
            oTable.destroy();
            //$('#tabla_listado tbody').off( 'click', 'td.details-control');
        }


        oTable = $('#tabla-respuestas').DataTable({
            "language": {
                        "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
                    },
            "autoWidth": true,
            "processing": true,
            "serverSide": true,
            "destroy":true,
            "pageLength": 25,
            "deferRender": true,
            "lengthMenu": [[5, 10, 25, 50, 100, 1000], [5, 10, 25, 50, 100, 1000]],
            "searching": true,
            "ajax":{
                    "headers": {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                    "url": ruta,
                    "data": { ide_titulo: ide_titulo
                    },
                    "type": "POST"
                },
            "columns": [
                {data: 'agrupacion', name: 'agrupacion'},
                {data: 'tpo_nom_agrupacion', name: 'tpo_nom_agrupacion'},
                {data: 'username_crea', name: 'username_crea'},
                {data: 'fch_crea', name: 'fch_crea'},
                {data: 'username_mod', name: 'username_mod'},
                {data: 'fch_mod', name: 'fch_mod'}

            ],
            "order": [[1, 'desc']]
        });
        $("#respuestas-container").show();
    }











});
