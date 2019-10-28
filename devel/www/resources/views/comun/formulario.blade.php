@extends('adminlte::page')

@section('title', 'Formulario')

@section('content_header')
    <h1>Formulario</h1>
    <ol class="breadcrumb">
      <li><a href="{{ route('home') }}"><i class="fa fa-home"></i> Inicio</a></li>
      <li class="active">Formulario</li>
    </ol>
@stop

@section('content')
    <form method="POST" action="{{ route('formulario') }}" name="frmFormularios" id="frmFormularios">
      <input type="hidden" name="ruta_agrupacion" id="ruta_agrupacion" value="{{ route('agrupacion') }}">
      <input type="hidden" name="ruta_etiqueta" id="ruta_etiqueta" value="">
      {!! csrf_field() !!}
      <!-- Inicio bloque 1 -->
      <div class="row">
        <div class="form-group col-sm-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Selección de formulario</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group col-sm-6">
                <label for="formularios">Formulario</label>
                <select class="form-control js-formulario-basic-single" name="formularios" id="formularios">
                  <option value="0" selected >Seleccione formulario</option>
                  @foreach($Titulos as $key=>$Titulo)
                    <option value="{{ $Titulo->ide_titulo }}">{{ $Titulo->titulo }}</option>
                  @endforeach
                </select>


              </div>
              <div class="form-group col-sm-6">
                <label for="boton">&nbsp;</label>
                <button type="button" id="mostrar_formulario" class="btn btn-primary btn-block">Mostrar <i class="fa fa-search"></i></button>
              </div>
            </div>
            <!-- ./box-body -->
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-12">
                  <div class="description-block border-right">
                  </div>
                  <!-- /.description-block -->
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
      <!-- Inicio bloque 2 -->
      <div class="row">
        <div class="form-group col-sm-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Formulario</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="form-group col-sm-6">
                <label for="fechinicio"></label>

              </div>
            </div>
            <!-- ./box-body -->
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-12">
                    <div class="form-group col-md-6 col-md-offset-6">
                      <button type="button" id="grabar_formulario" class="btn btn-primary btn-block">Grabar <i class="fa fa-save"></i></button>
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
      <!-- Fin bloque 2 -->


    </form>



@stop

@section('js')

  <script src="{{ asset('js/comun/formulario.js') }}" type="text/javascript"></script>

@stop
