<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//Auth::routes();
Auth::routes(['register' => false]);

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/all', 'HomeController@all')->name('all');


// Comun - Formulario
Route::get('/comun/formulario', 'Comun\FormularioController@index')->name('formulario');
Route::post('/comun/agrupacion2', 'Comun\FormularioController@agrupacion2')->name('agrupacion2');
Route::post('/comun/etiqueta2', 'Comun\FormularioController@etiqueta2')->name('etiqueta2');
Route::post('/comun/grabaformulario', 'Comun\FormularioController@GrabaFormulario')->name('grabaformulario');

// Profile
Route::get('/profile/datospersonales', 'Profile\ProfileController@DatosPersonales')->name('datospersonales');
Route::get('/profile/cambioclave', 'Profile\ProfileController@CambioClave')->name('cambioclave');

// Admin
Route::get('/admin/usuarios', 'Admin\AdminController@Usuarios')->name('usuarios');
Route::get('/admin/listarusuarios', 'Admin\AdminController@ListarUsuarios')->name('listarusuarios');
Route::get('/admin/formularios', 'Admin\AdminController@Formularios')->name('formularios');
Route::get('/admin/listarformularios', 'Admin\AdminController@ListarFormularios')->name('listaformularios');


/*
Route::get('/home', function() {
    return view('home');
})->name('home')->middleware('auth');

Auth::routes();

Route::get('/home', function() {
    return view('home');
})->name('home')->middleware('auth');

Auth::routes();

Route::get('/home', function() {
    return view('home');
})->name('home')->middleware('auth');
*/
