@extends('adminlte::page')

@section('title', 'Formulario')

@section('content_header')
    <h1>En construcción</h1>
    <ol class="breadcrumb">
      <li><a href="{{ route('home') }}"><i class="fa fa-home"></i> Inicio</a></li>
    </ol>
@stop

@section('content')
    <form method="POST" action="{{ route('usuarios') }}" name="frmUsuarios" id="frmFormularios">
      <input type="hidden" name="ruta_etiqueta2" id="ruta_etiqueta2" value="{{ route('etiqueta2') }}">
      {!! csrf_field() !!}
      <!-- Inicio bloque 1 -->
      <div class="row">
        <div class="form-group col-sm-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"></h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              <div class="form-group col-sm-12">
                  <p align="center"><img src="{{ asset('images/construccion/barrera001.png') }}" alt="En costrucción"> </p>
              </div>
            </div>
            <!-- ./box-body -->
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-12">
                  <div class="description-block border-right">
                    &nbsp;
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      <!-- Fin bloque 1 -->
    </form>



@stop

@section('js')

  <script src="{{ asset('js/admin/adminstrador.js') }}" type="text/javascript"></script>

@stop
