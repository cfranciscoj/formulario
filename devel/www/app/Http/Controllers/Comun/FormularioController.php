<?php

namespace App\Http\Controllers\Comun;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Formulario as Formulario;

class FormularioController extends Controller
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

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        //$IdUsuario = Auth::id();
        $Formulario = new Formulario;
        $Titulos = $Formulario->TraeTitulo();

        return view('comun/formulario')->with(['Titulos'=>$Titulos]);
    }

    public function agrupacion(Request $request)
    {
      $ide_titulo = request()->ide_titulo;
      $Formulario = new Formulario;
      $Agrupaciones = $Formulario->TraeAgrupacion($ide_titulo);
      return json_encode($Agrupaciones);
      
    }

    public function etiqueta(Request $request)
    {
    }

}
