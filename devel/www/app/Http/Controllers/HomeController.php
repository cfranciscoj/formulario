<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
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
        //return redirect()->action('HomeController@index');
        if (Auth::user()->hasRole('admin')) {
            return view('home');
        } elseif (Auth::user()->hasRole('user')) {
            return redirect()->route('formulario');//->with('status', 'Profile updated!');
            ///return view('formulario')->with('status', 'Profile updated!');
        } elseif (Auth::user()->hasRole('super')) {
            return view('home');
        } else {
            return view('all');
        }


        //return view('home');
    }
}
