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

    public function agrupacion(Request $request)
    {
      $json_data = array();
      $array_data = array();
      $array_agrupacion = array();
      $array_etiquetas = array();
      $array_to_json = array();
      $array_ide_agrupacion = array();


       $eti_datos_vacio = array("ide_etiqueta"     => "0",
                                "ide_agrupacion"   => "0",
                                "etiqueta"         => "0",
                                "tpo_val_etiqueta" => "0");

       $eti_vacio = array("eti"     => $eti_datos_vacio,
                          "tot_registros" => "0",
                          "correcto"      => false);

       $agru_datos_vacio = array("ide_agrupacion"     => "0",
                                 "ide_titulo"         => "0",
                                 "agrupacion"         => "0",
                                 "tpo_val_agrupacion" => "0",
                                 "eti"                => $eti_vacio);

       $agru_vacio = array("agru"  => $agru_datos_vacio,
                           "tot_registros" => "0",
                           "correcto"      => false);

      //$json_data["datos"] = $agru_vacio;


      $i = 0;
      $ide_agrupacion = 0;


      $ide_titulo = request()->ide_titulo;
      $Formulario = new Formulario;
      $Agrupaciones = $Formulario->TraeAgrupacion($ide_titulo);
      $FormularioController = new FormularioController;

      foreach ($Agrupaciones as $valor) {
          $array_data["agru"][] = $valor;
          $array_agrupacion[0] = $valor;

          foreach ($array_agrupacion as $obj) {
             $ide_agrupacion   = $obj->ide_agrupacion;
           }


          $Etiquetas = $FormularioController->etiqueta($ide_agrupacion);

          $array_etiquetas["eti"] = array();
          $array_etiquetas["eti"] = json_decode($Etiquetas, true);

          $resultado = array_merge(array($array_data["agru"]["0"]),array($array_etiquetas));

          $json_data["datos"][] = $resultado;

          $array_data = array();
          foreach ($array_data as $j => $value) {
              unset($array_data[$j]);
          }
          $array_agrupacion = array();
          foreach ($array_agrupacion as $k => $value) {
              unset($array_agrupacion[$k]);
          }
          $array_etiquetas = array();
          foreach ($array_etiquetas as $m => $value) {
              unset($array_etiquetas[$m]);
          }
          $ide_agrupacion = 0;
          $i++;
      }


      if( $i > 0 ) {
        $json_data["tot_registros"] = $i;
        $json_data["correcto"] = true;
      }
      else{
        $json_data["datos"] = $agru_vacio;
        $json_data["tot_registros"] = 0;
        $json_data["correcto"] = false;

        }
      return json_encode($json_data);

    }

// Etiquetas
    public function etiqueta($ide_agrupacion)
    {
      $array_data = array();
      $array_vacio = array("ide_etiqueta"     => "0",
                           "ide_agrupacion"   => "0",
                           "etiqueta"         => "0",
                           "tpo_val_etiqueta" => "0");
      $i = 0;


      //$ide_agrupacion = $request;
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
}
