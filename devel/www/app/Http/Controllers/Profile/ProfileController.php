<?php

namespace App\Http\Controllers\Profile;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Profile as Profile;

class ProfileController extends Controller
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
  public function DatosPersonales()
  {
      $IdUsuario = Auth::id();
      $Profile = new Profile;
      $DatosPersonales = $Profile->TraeDatosPersonales($IdUsuario);

      return view('profile/datospersonales')->with(['DatosPersonales'=>$DatosPersonales]);
  }

  public function CambioClave(Request $request)
  {
      $IdUsuario = Auth::id();
      $ClaveNueva = $request->clavenueva;
      $Profile = new Profile;
      $Clave = $Profile->ActCambiaClave($IdUsuario, $ClaveNueva);

      return view('profile/cambioclave');
  }

}
