@extends('adminlte::page')

@section('title', 'Formulario')

@section('content_header')
    <h1>Creación de usuarios</h1>
    <ol class="breadcrumb">
      <li><a href="{{ route('home') }}"><i class="fa fa-home"></i> Inicio</a></li>
      <li class="active">Administar</li>
      <li class="active">Usuarios</li>
      <li class="active">Crear</li>
    </ol>
@stop

@section('content')
    <form method="POST" action="{{ route('usuarios') }}" name="frmUsuarios" id="frmFormularios">
      <input type="hidden" name="ruta_etiqueta2" id="ruta_etiqueta2" value="{{ route('etiqueta2') }}">
      {!! csrf_field() !!}
      <!-- Inicio bloque 1 -->
      <div class="row">
        <div class="form-group col-sm-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Datos personales</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              <div class="form-group col-sm-6">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" name="nombre" id="nombre" value="">
              </div>
              <div class="form-group col-sm-6">
                <label for="apellido">Apellido</label>
                <input type="text" class="form-control" name="apellido" id="apellido" value="">
              </div>
              <div class="form-group col-sm-6">
                <label for="email">e-mail</label>
                <input type="text" class="form-control" name="email" id="email" value="">
              </div>
              <div class="form-group col-sm-6">
                <label for="username">UserName</label>
                <input type="text" class="form-control" name="username" id="username" value="">
              </div>
              <div class="form-group col-sm-6">
                <label for="privilegios">Privielegios</label>
                <select class="form-control js-formulario-basic-single" name="privilegios" id="privilegios">
                  <option value="0" selected>Seleccione privilegio</option>
                  <option value="1">Administrador</option>
                </select>
              </div>
              <div class="form-group col-sm-6">
                <label for="grupos">Grupos / Empresa</label>
                <select class="form-control js-formulario-basic-single" name="grupos" id="grupos">
                  <option value="0" selected>Seleccione grupo</option>
                  <option value="1">Grupo uno</option>
                </select>
              </div>

            </div>
            <!-- ./box-body -->
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-12">
                  <div class="description-block border-right">
                  </div>
                  <div class="form-group col-sm-3">
                    &nbsp;
                  </div>
                  <div class="form-group col-sm-3">
                    <button type="button" id="creausuario" class="btn btn-primary btn-block">Limpiar <i class="fa fa-eraser"></i></button>
                  </div>
                  <div class="form-group col-sm-3">
                    <button type="button" id="creausuario" class="btn btn-primary btn-block">Guardar <i class="fa fa-save"></i></button>
                  </div>
                  <div class="form-group col-sm-3">
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
