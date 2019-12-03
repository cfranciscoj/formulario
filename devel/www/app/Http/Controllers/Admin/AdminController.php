<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\Datatables\DataTables;
use Yajra\DataTables\DataTablesServiceProvider;
use App\Admin as Admin;
use App\Formulario as Formulario;


class AdminController extends Controller
{
  /**
   * Create a new controller instance.
   *
   * @return void
   */
  public function __construct()
  {
      $this->middleware('auth');
  }

  public function Usuarios()
  {

      return view('admin/usuarios');
  }

  public function ListarUsuarios()
  {

      return view('admin/enconstruccion');
  }

  public function Formularios()
  {

      return view('admin/enconstruccion');
  }

  public function ListarFormularios()
  {
      $Formulario = new Formulario;
      $Titulos = $Formulario->TraeTitulo();
      return view('admin/listarformularios')->with(['Titulos'=>$Titulos]);
  }

  public function ListarRespFormularios(Request $request)
  {
      $Admin = new Admin;
      $ide_titulo = request()->ide_titulo;
      $Respuestas = $Admin->TraePlanResp($ide_titulo);
      //return json_encode($Respuestas);

      return DataTables::of($Respuestas)->make(true);

  }

}
