@extends('adminlte::page')

@section('title', 'Formulario')

@section('content_header')
    <h1>Datos Personales</h1>
    <ol class="breadcrumb">
      <li><a href="{{ route('home') }}"><i class="fa fa-home"></i> Inicio</a></li>
      <li class="active">Datos personales</li>
    </ol>
@stop

@section('content')
    <form method="POST" action="{{ route('formulario') }}" name="frmFormularios" id="frmFormularios">
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
              @foreach($DatosPersonales as $key=>$DatoPersonal)
              <div class="form-group col-sm-6">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" name="nombre" id="nombre" value="{{ $DatoPersonal->nombre }}">
              </div>
              <div class="form-group col-sm-6">
                <label for="apellido">Apellido</label>
                <input type="text" class="form-control" name="apellido" id="apellido" value="{{ $DatoPersonal->apellido }}">
              </div>
              <div class="form-group col-sm-6">
                <label for="email">e-mail</label>
                <input type="text" class="form-control" name="email" id="email" value="{{ $DatoPersonal->email }}">
              </div>
              <div class="form-group col-sm-6">
                <label for="username">UserName</label>
                <input type="text" class="form-control" name="username" id="username" value="{{ $DatoPersonal->username }}">
              </div>
              @endforeach

            </div>
            <!-- ./box-body -->
            <div class="box-footer">
              <div class="row">
                <div class="col-sm-12">
                  <div class="description-block border-right">
                  </div>
                  <div class="form-group col-sm-6">
                    &nbsp;
                  </div>
                  <div class="form-group col-sm-6">
                    <button type="button" id="actualiza_datopersonal" class="btn btn-primary btn-block">Actualizar <i class="fa fa-save"></i></button>
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
