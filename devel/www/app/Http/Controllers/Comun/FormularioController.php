<?php

namespace App\Http\Controllers\Comun;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
//use Illuminate\Contracts\Support\Arrayable;
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



// AGRUPACIÓN DOS
    public function agrupacion2(Request $request)
    {

      $array_data = array();
      $array_vacio = array("ide_agrupacion"     => "0",
                           "ide_titulo"         => "0",
                           "agrupacion"         => "0",
                           "tpo_val_agrupacion" => "0");
      $i = 0;


      $ide_titulo = request()->ide_titulo;
      $Formulario = new Formulario;
      $Agrupaciones = $Formulario->TraeAgrupacion($ide_titulo);
      //var_dump($Etiquetas);
      foreach ($Agrupaciones as $valor) {
          $array_data["agru"][] = $valor;
          $i++;
      }


      if( $i > 0 ) {
        $array_data["tot_registros"] = $i;
        $array_data["correcto"] = true;
      }
      else{
        $array_data["agru"][] = $array_vacio;
        $array_data["tot_registros"] = $i;
        $array_data["correcto"] = false;

        }
      return json_encode($array_data);
    }

//ETIQUETA DOS
    public function etiqueta2(Request $request)
    {
      $array_data = array();
      $array_vacio = array("ide_etiqueta"     => "0",
                           "ide_agrupacion"   => "0",
                           "etiqueta"         => "0",
                           "tpo_val_etiqueta" => "0");
      $i = 0;


      $ide_agrupacion = request()->ide_agrupacion;
      $Formulario = new Formulario;
      $Etiquetas = $Formulario->TraeEtiqueta($ide_agrupacion);
      //var_dump($Etiquetas);
      foreach ($Etiquetas as $valor) {
          $array_data["datose"][] = $valor;
          $i++;
      }


      if( $i > 0 ) {
        $array_data["tot_registrose"] = $i;
        $array_data["correctoe"] = true;
      }
      else{
        $array_data["datose"][] = $array_vacio;
        $array_data["tot_registrose"] = $i;
        $array_data["correctoe"] = false;

        }
      return json_encode($array_data);
    }

    public function GrabaFormulario(Request $request)
    {

      $array_data = array();
      $array_data = request()->valor;
      $array_seq = array();
      $IdUsuario = Auth::id();
      $Formulario = new Formulario;
      $array_seq = $Formulario->TraeSecuenciaFormulario();
      foreach ($array_seq as $key=>$value) {
        $seq_form = $value->nro_formulario;
      }


      foreach ($array_data as $key=>$value) {
          //var_dump($value["valor"]);
          $ide = $Formulario->GrabaRespuesta($value["ide"],$value["valor"],$IdUsuario,$seq_form);

      }
      $arrayName = array('ide' => $ide );
      return json_encode($arrayName);
    }

}
